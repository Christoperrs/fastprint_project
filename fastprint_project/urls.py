
from django.contrib import admin
from django.urls import path
from produk import views

urlpatterns = [
    path('admin/', admin.site.urls),
   path('', views.produk_list, name='produk_list'),
    path('sync/', views.sync_api, name='sync_api'),
    path('tambah/', views.produk_tambah, name='produk_tambah'),
    path('edit/<int:pk>/', views.produk_edit, name='produk_edit'),
   path('hapus/<int:pk>/', views.produk_hapus, name='produk_hapus'),
   path('kategori/', views.kategori_list, name='kategori_list'),
    path('kategori/tambah/', views.kategori_tambah, name='kategori_tambah'),
    path('kategori/edit/<int:pk>/', views.kategori_edit, name='kategori_edit'),
    path('kategori/hapus/<int:pk>/', views.kategori_hapus, name='kategori_hapus'),
    path('dashboard/', views.dashboard_crm, name='dashboard_crm'),
]