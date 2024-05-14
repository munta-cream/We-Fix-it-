from django.shortcuts import render, redirect, get_object_or_404
from .models import Technician
from django.contrib.auth import login, authenticate,logout
from wefixit.forms import CustomUserCreationForm, UserEditForm
from .models import Category,User
from django.contrib.auth.decorators import login_required
from .models import Product,Category,Order,OrderItem
from django.core.paginator import Paginator

from .forms import CartAddPrdocutForm,ProductCreateForm,OrderCreateForm
from wefixit.cart import Cart
from django.views.decorators.http import require_POST
import stripe;
from django.conf import settings

stripe.api_key=settings.STRIPE_SECRET_KEY

# Create your views here.

def signup(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = CustomUserCreationForm()
    return render(request, 'signup.html', {'form': form})

def user_login(request):

    if request.method=="POST":
            username = request.POST['username1']
            password = request.POST['password1']                                                
            user = authenticate(request, username = username, password=password) 

            if user is not None:
                login(request, user)
                return redirect('index')
            else:
                # messages.success(request, ("Error loging in try again later ..."))
                return redirect('login')
    else:
        context = {'title':'Login'}
    return render(request, 'login.html', context)

def logout_user(request):
    logout(request)
   
    return redirect('index')



def home(request):
    return render(request, 'index.html')


def contact(request):
    return render(request, 'contact.html')

def about(request):
    return render(request, 'about.html')

def profile(request):
    return render(request, 'profile.html')



def product_list(request,category_slug=None):
    category= None
    categories= Category.objects.all()
    products = Product.objects.filter(available=True)
    if category_slug:
        category=get_object_or_404(Category,slug=category_slug)
        products=Product.objects.filter(category=category)

    prod_list=products
    paginator= Paginator(prod_list,5)
    page=request.GET.get('page')
    prod = paginator.get_page(page)


    context= {'category':category,'categories':categories,'products':prod}  
    return render(request,'product/list_product.html',context) 

def product_create(request):
    if request.method=='POST':
        form=ProductCreateForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('prodlist')
    else:
        form=ProductCreateForm()

    return render(request,'product/create.html',{'form':form})     

def product_detail(request,id,slug):
    product=get_object_or_404(Product,id=id,slug=slug,available=True)
    cart_product_from=CartAddPrdocutForm()
    
    context= {'product':product,'cart_product_from':cart_product_from} 
    # return render(request,'product/detail_product.html',context)
    return render(request,'product/detail.html',context) 

@require_POST
def cart_add(request,product_id):
    if request.user.is_authenticated:
        cart=Cart(request)
        product=get_object_or_404(Product,id=product_id)
        form=CartAddPrdocutForm(request.POST)
        if form.is_valid():
            cd=form.cleaned_data
            cart.add(product=product,quantity=cd['quantity'],update_quantity=cd['update'])

        return redirect('cart_detail')
    else:
        return redirect('login')

def cart_remove(request,product_id):
    cart=Cart(request)
    product=get_object_or_404(Product,id=product_id)
    cart.remove(product)

    return redirect('cart_detail')

def cart_detail(request):
    cart= Cart(request)
    for item in cart:
        item['update_quantity_form']=CartAddPrdocutForm(initial={'quantity':item['quantity'],'update':True})

    return render(request,'cart/detail_cart.html',{'cart':cart})   

def order_create(request):
    cart=Cart(request)
    if request.method == 'POST':
        form=OrderCreateForm(request.POST)
        if form.is_valid():
            order=form.save()
            for item in cart:
                OrderItem.objects.create(
                    order=order,
                    product=item['product'],
                    price=item['price'],
                    quantity=item['quantity']
                )
            request.session['totalprice'] = float(order.get_total_cost())*float(100)
            request.session['order_id'] = int(order.id)
            cart.clear()
            key=settings.STRIPE_PUBLISHABLE_KEY
            context={"key": key,'order':order}    
        return render(request,'order/payment.html',context)
                        
    else:
        form=OrderCreateForm()
    return render(request,'order/create.html',{'form':form})

def order_list(request,order_id=None):
    # order_id= None
    order= Order.objects.all()
    orderItem = OrderItem.objects.all()
    if order_id:
        order=get_object_or_404(Order,id=order_id)
        orderItem=OrderItem.objects.filter(order=order)

    context= {'order':order,'orderItem':orderItem}  
    return render(request,'order/list_order.html',context) 

def order_all(request):
    order= Order.objects.all()    
    context= {'order':order}  
    return render(request,'order/list_all.html',context)

# def payment(request):
#     key=settings.STRIPE_PUBLISHABLE_KEY
    
#     context={"key": key}    
#     return render(request,'order/payment.html',context)


def charge(request):
    
    key=settings.STRIPE_PUBLISHABLE_KEY
    tp =  request.session['totalprice']
    id= request.session['order_id']

    if request.method=='POST':        
        print(tp)
        print(id)
        charge=stripe.Charge.create(
            amount=int(tp), #order_price,
            currency='bdt',
            description='django charge',
            source=request.POST['stripeToken']
        )

        #order = Order.objects.filter(pk=id)
        order=get_object_or_404(Order,id=id)
        orderItem=OrderItem.objects.filter(order=order)

    context={"key": key,'order_price':tp,'order_id':id,'order':order,'orderItem':orderItem}    
    return render(request,'order/charge.html',context)
    
