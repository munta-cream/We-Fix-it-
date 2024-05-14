from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from .models import Product,Category,Order
PRODUCT_QUNANTITY_CHOICE=[ (i,str(i)) for i in range(1,11)]


class CustomUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = User
        fields = ('username', 'email', 'password1', 'password2')



class UserEditForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username', 'email']


class CartAddPrdocutForm(forms.Form):
    quantity=forms.TypedChoiceField(choices=PRODUCT_QUNANTITY_CHOICE,coerce=int)
    update=forms.BooleanField(required=False,initial=False,widget=forms.HiddenInput)

class ProductCreateForm(forms.ModelForm):
    class Meta:
        model=Product
        fields = "__all__"
        exclude = ('slug',)

class OrderCreateForm(forms.ModelForm):
    class Meta:
        model=Order
        fields = ['first_name','last_name','email','phone','problems','address','postal_code','city']
        


