from django.db import models
# from models import user
from django.contrib.auth.models import AbstractUser,User
from django.urls import reverse

from django.utils.text import slugify
 
# Create your models here.
class Technician(models.Model):
    name = models.CharField(max_length=100)
    expertise = models.CharField(max_length=200)
    contact = models.CharField(max_length=20)
    picture = models.FileField(upload_to='technician_pictures/')



class Category(models.Model):
    name = models.CharField(max_length=150,db_index=True)
    slug = models.SlugField(max_length=150,unique=True,db_index=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('product_list_by_category',args=[self.slug])   

class Product(models.Model):
    category= models.ForeignKey(Category,related_name='products',on_delete=models.CASCADE)
    name = models.CharField(max_length=100,db_index=True)
    slug = models.SlugField(max_length=100,db_index=True)
    description = models.TextField(blank=True)
    price =models.DecimalField(max_digits=10,decimal_places=2)
    available =models.BooleanField(default=True)
    stock = models.PositiveIntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    image = models.FileField(upload_to='products/%Y/%m/%d',default='products/blank.png',blank=True)

    class Meta:
        ordering=('name',)
        index_together=(('id','slug'),)  

    def __str__(self):
        return self.name 

    # def save(self,*args,**kwargs):
    #     if not self.slug:
    #         self.slug=slugify(self.name)
    #     return super().save(self,*args,**kwargs)    

    def get_absolute_url(self):
        return reverse('product_detail',args=[self.id,self.slug]) 

class Order(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    phone= models.CharField(max_length=15) 
    problems= models.TextField()
    address = models.CharField(max_length=150)
    postal_code = models.CharField(max_length=30)
    city = models.CharField(max_length=100)
    paid = models.BooleanField(default=False)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering=('-created',)
        

    def __str__(self):
        return 'order {}'.format(self.id) 

    def get_total_cost(self):
        return sum(item.get_cost() for  item in self.items.all()) 
    
    
class OrderItem(models.Model):
    order= models.ForeignKey(Order,related_name='items',on_delete=models.CASCADE)
    product= models.ForeignKey(Product,related_name='order_items',on_delete=models.CASCADE)
    price =models.DecimalField(max_digits=10,decimal_places=2)
    quantity = models.PositiveIntegerField(default=1)
    
    
    def __str__(self):
        return 'order item {}'.format(self.product) 

    def get_cost(self):
        return self.price * self.quantity    
         