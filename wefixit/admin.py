from django.contrib import admin
from .models import  Product, Category, Technician ,Order, OrderItem


# Register your models here.
class CatagoryAdmin(admin.ModelAdmin):
    list_display= ['name','slug']
    prepopulated_fields= {'slug':('name',)}

class ProductAdmin(admin.ModelAdmin):
    list_display= ['name','slug','price','stock','available','created_at','updated_at']
    list_filter = ['available','created_at','updated_at']
    list_editable = ['price','stock','available']
    prepopulated_fields= {'slug':('name',)}  



class OrderItemInline(admin.TabularInline):
    model= OrderItem
    raw_id_fields = ['product']
    
class OrderAdmin(admin.ModelAdmin):
    list_display= ['id','first_name','last_name','email','phone','problems','address','postal_code','city','paid','created','updated']
    list_filter = ['paid','created','updated'] 
    inlines = [OrderItemInline] 

admin.site.register(Category,CatagoryAdmin)
admin.site.register(Product,ProductAdmin)
admin.site.register(Order,OrderAdmin)
admin.site.register(Technician)
admin.site.register(OrderItem)

