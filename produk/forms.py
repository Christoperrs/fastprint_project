from django import forms
from .models import Produk
from .models import Kategori    
class ProdukForm(forms.ModelForm):
    class Meta:
        model = Produk
        fields = ['id_produk', 'nama_produk', 'harga', 'kategori', 'status']
        widgets = {
            'id_produk': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'ID Produk'}),
            'nama_produk': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Nama Produk'}),
            'harga': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Contoh: 15000'}),
            'kategori': forms.Select(attrs={'class': 'form-select'}),
            'status': forms.Select(attrs={'class': 'form-select'}),
        }
        
class KategoriForm(forms.ModelForm):
    class Meta:
        model = Kategori
        fields = ['nama_kategori']
        widgets = {
            'nama_kategori': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Masukkan Nama Kategori'}),
        }