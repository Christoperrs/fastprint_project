from django.shortcuts import render, redirect
from django.http import JsonResponse
import requests
import hashlib
from datetime import datetime
from .models import Produk, Kategori, Status
from .serializers import ProdukSerializer
from .forms import KategoriForm
from django.contrib import messages
from django.db.models import Count

def produk_list(request):
    
    data_produk = Produk.objects.select_related('kategori', 'status').filter(status__nama_status='bisa dijual')
    
    context = {
        'produks': data_produk
    }
    return render(request, 'produk/produk_index.html', context)
from django.shortcuts import render, redirect, get_object_or_404
from .forms import ProdukForm
from .models import Produk

# Tambah Produk
def produk_tambah(request):
    if request.method == "POST":
        form = ProdukForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('produk_list')
    else:
        form = ProdukForm()
    return render(request, 'produk/produk_form.html', {'form': form, 'title': 'Tambah Produk'})

# Edit Produk
def produk_edit(request, pk):
    produk = get_object_or_404(Produk, pk=pk)
    if request.method == "POST":
        form = ProdukForm(request.POST, instance=produk)
        if form.is_valid():
            form.save()
            return redirect('produk_list')
    else:
        form = ProdukForm(instance=produk)
    return render(request, 'produk/produk_form.html', {'form': form, 'title': 'Edit Produk'})

# Hapus Produk
def produk_hapus(request, pk):
    produk = get_object_or_404(Produk, pk=pk)
    produk.delete()
    return redirect('produk_list')

# Sinkronisasi Data dari API Fastprint
def sync_api(request):

    now = datetime.now()
    jam = now.strftime('%H')
    
    username = f"tesprogrammer{now.strftime('%d%m%y')}C{jam}"
    password_plain = f"bisacoding-{now.strftime('%d-%m-%y')}"
    password_md5 = hashlib.md5(password_plain.encode()).hexdigest()

    url = "https://recruitment.fastprint.co.id/tes/api_tes_programmer"
    
    try:
        response = requests.post(url, data={'username': username, 'password': password_md5})
        result = response.json()

        if result.get('error') == 0:
            for item in result['data']:
                kat, _ = Kategori.objects.get_or_create(nama_kategori=item['kategori'])
                stat, _ = Status.objects.get_or_create(nama_status=item['status'])

                data_json = {
                    'id_produk': item['id_produk'],
                    'nama_produk': item['nama_produk'],
                    'harga': item['harga'],
                    'kategori': kat.id,
                    'status': stat.id
                }

                existing = Produk.objects.filter(id_produk=item['id_produk']).first()
                serializer = ProdukSerializer(existing, data=data_json) if existing else ProdukSerializer(data=data_json)
                
                if serializer.is_valid():
                    serializer.save()
            
            return redirect('produk_list')
        else:
            return JsonResponse({
                "status": "error",
                "message": result.get('ket'),
                "debug_info": {
                    "username_used": username,
                    "password_plain": password_plain,
                    "password_md5": password_md5,
                    "server_response": result
                }
            })
            
    except Exception as e:
        return JsonResponse({
            "status": "exception",
            "message": str(e),
            "debug_info": {
                "username_used": username,
                "password_md5": password_md5
            }
        })  
    
def kategori_list(request):
    data_kategori = Kategori.objects.all()
    return render(request, 'produk/kategori_index.html', {'kategori': data_kategori})

def kategori_tambah(request):
    if request.method == "POST":
        form = KategoriForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('kategori_list')
    else:
        form = KategoriForm()
    return render(request, 'produk/kategori_form.html', {'form': form, 'title': 'Tambah Kategori'})

def kategori_edit(request, pk):
    kat = get_object_or_404(Kategori, pk=pk)
    if request.method == "POST":
        form = KategoriForm(request.POST, instance=kat)
        if form.is_valid():
            form.save()
            return redirect('kategori_list')
    else:
        form = KategoriForm(instance=kat)
    return render(request, 'produk/kategori_form.html', {'form': form, 'title': 'Edit Kategori'})

def kategori_hapus(request, pk):
    kategori_obj = get_object_or_404(Kategori, pk=pk)
    
    produk_terkait = kategori_obj.produk_set.exists() 

    if produk_terkait:
        messages.error(request, f"Kategori '{kategori_obj.nama_kategori}' tidak bisa dihapus karena masih digunakan oleh beberapa produk.")
        return redirect('kategori_list')
    else:
        kategori_obj.delete()
        messages.success(request, "Kategori berhasil dihapus.")
        return redirect('kategori_list')
    
    
def dashboard_crm(request):
    total_produk = Produk.objects.count()
    total_kategori = Kategori.objects.count()
    produk_aktif = Produk.objects.filter(status__nama_status='bisa dijual').count()
    produk_nonaktif = Produk.objects.filter(status__nama_status='tidak bisa dijual').count()
    statistik_kategori = Kategori.objects.annotate(jumlah_produk=Count('produk'))

    context = {
        'total_produk': total_produk,
        'total_kategori': total_kategori,
        'produk_aktif': produk_aktif,
        'produk_nonaktif': produk_nonaktif,
        'statistik_kategori': statistik_kategori,
    }
    return render(request, 'produk/dashboard.html', context)