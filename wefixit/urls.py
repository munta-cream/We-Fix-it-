from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='index'),
    # path('accounts/', include('django.contrib.auth.urls')),
    # Define URLs for other pages similarly
    path('signup',views.signup,name='signup'),
    path('user_login',views.user_login,name='login'),
    path('logout_user',views.logout_user,name='logout_user'),
    path('contact/', views.contact, name='contact'),
    path('about/', views.about, name='about'),
    path('profile/', views.profile, name='profile'),
   
    path('prodlist',views.product_list,name='prodlist'),
    path('list/<str:category_slug>/',views.product_list,name='product_list_by_category'),
    path('<int:id>/<str:slug>/',views.product_detail,name='product_detail'),
    path('product_create/',views.product_create,name='product_create'),

    path('cart_detail/',views.cart_detail,name='cart_detail'),
    path('add/<int:product_id>/',views.cart_add,name='cart_add'),
    path('remove/<int:product_id>/',views.cart_remove,name='cart_remove'),
    
    path('create/',views.order_create,name='order_create'),
    path('order_list/<int:order_id>/',views.order_list,name='order_list'),
    path('order_all/',views.order_all,name='order_all'),
    # path('payment/',views.payment,name='payment'),
    path('charge/',views.charge,name='charge'),
    
    


]

