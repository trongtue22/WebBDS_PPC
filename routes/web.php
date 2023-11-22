<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AddFullContract;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');    
});



// Truy cập vào trang web PPC bằng URL => Lúc truy cập sẽ show ra trang web với đầy đủ data 
Route::get('/web', [AddFullContract::class,'showFullContract']);

// Khi ấn nút submit -> Đưa data vào trong để check Validation()
Route::post('/web',[AddFullContract::class,'checkFormatContract']);

// Insert data into DB 
Route::get('/add_data',[AddFullContract::class,'addFullContract']);

