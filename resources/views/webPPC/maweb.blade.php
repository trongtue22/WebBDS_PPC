<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WEB PPC</title>
    <!-- <link rel="stylesheet" type="text/css" href="/public/css/style.css" />  -->
    <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!--CSS cho form thêm hợp đồng-->
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border: 3px solid #f1f1f1;
  z-index: 9;
  max-height: 80%; /* Set a maximum height for the form popup */
  overflow-y: auto; /* Enable vertical scrolling */
}

/* Add styles to the form container */
.form-container {
  max-width: 500px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=date],
.form-container input[type=number], 
.form-container input[type=text], 
.form-container input[type=password] 
{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=date]:focus, 
.form-container input[type=number]:focus,
.form-container input[type=text]:focus, 
.form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: black;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 40%;
  margin-bottom:10px;
  opacity: 0.8;
}

.form-container .cancel{
  margin-left: 18%;
}
/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}

</style>
</head>

<body>
<div class="white-background"> <!-- Thẻ div nền trắng bắt đầu -->

<header>
    <h1>PPC</h1> <!--Header trang web ghi PPC-->
</header>

<filed class="form-popup" id="myForm">
             <!-- This is where user will type in data -->
  
  <!-- /add_data           -->
  
  <form action="/web" method="POST" class="form-container">
          <h3 style="background-color: black; color: white; text-align: center; padding: 30px 10px 30px 10px;">
          Thêm hợp đồng thanh toán một lần</h3>
          @if($errors->any())
            <script>
              window.addEventListener('DOMContentLoaded', (event) => {
              document.getElementById("myForm").style.display = "block";
              });
            </script>
          @endif

    <!--Bỏ trường nhập Mã Hợp Đồng vì Mã hợp đồng được tạo tự động ko cần nhập-->
    <!--Trường nhập họ và tên -->
    @csrf
    
    <div class="mb-3">
      <!-- Họ và tên -->
       <label for="fullName"><b>Họ và tên</b></label>
        <input type="text" placeholder="Điền họ và tên khách hàng" name="fullName" class="form-control" value="{{ old('fullName') }}" >
      @error("fullName")
          <span style='color:red;'>{{$message}}</span>
      @enderror
    </div>
    <!-- <br> -->

    <!--Trường nhập SSN (error)-->
    <div class="mb-3">
      <label for="SSN"><b>Số CMND</b></label>
        <input type="text" placeholder="Nhập CMND" name="SSN" class="form-control" value="{{ old('SSN') }}">
        @error("SSN")
          <span style='color:red;'>{{$message}}</span>   
        @enderror
    </div>

    <!-- Năm Sinh -->
    <div class="mb-3">
    <label for="YearOfBirth"><b> Năm sinh </b></label>
    <input type="number" placeholder="Nhập năm sinh" name="YearOfBirth" class="form-control" 
          @if( !$errors->has('YearOfBirth') ) 
            value="{{ old('YearOfBirth') }}" 
          @endif>
           
    @error("YearOfBirth")
        <span style='color:red;'>{{$message}}</span>   
    @enderror
    </div>
    
     <!-- Số điện thoại  -->
     <div class="mb-3">
      <label for="phoneNumber"><b> Số điện thoại </b></label>
       <input type="text" placeholder="Nhập số điện thoại" name="phoneNumber" class="form-control" value="{{ old('phoneNumber') }}">
        @error("phoneNumber")
         <span style='color:red;'>{{$message}}</span>   
        @enderror
    </div>

    <!-- Ngày lập hợp đồng  -->
    <div class="mb-3">
      <label for="DateContract"><b> Ngày lập hợp đồng </b></label>
      <input type="date" placeholder="Nhập ngày lập hợp đồng" name="DateContract" class="form-control" 
           @if(!$errors->has('DateContract')) value="{{ old('DateContract') }}" @endif required>
          
           <!-- Thông báo lỗi -->
        @error("DateContract")
          <span style='color:red;'>{{$message}}</span>   
        @enderror
    </div>

    <!-- Giá -->
    <div class="mb-3">
    <label for="Price"><b>Giá</b></label>
      <input type="number" step="1" placeholder="Nhập giá" name="Price" class="form-control" value="{{ old('Price') }}">
      @error("Price")
        <span style='color:red;'>{{$message}}</span>   
      @enderror
    </div>

    <!-- Tiền đặt cọc -->
    <div class="mb-3">
    <label for="Deposit"><b>Tiền cọc</b></label>
      <input type="number" step="1" placeholder="Nhập tiền cọc" name="Deposit" class="form-control" value="{{ old('Deposit') }}">
      @error("Deposit")
        <span style='color:red;'>{{$message}}</span>   
      @enderror
    </div>
    
    <!-- Số tiền còn lại -->
    <div class="mb-3">
    <label for="Remain"><b>Tiền còn lại</b></label>
      <input type="number" step="1" placeholder="Nhập tiền còn lại" name="Remain" class="form-control" value="{{ old('Remain') }}">
      @error("Remain")
        <span style='color:red;'>{{$message}}</span>   
      @enderror
    </div>





    <!--Trường nhập Trạng thái -->
    <div class="mb-3">
      <label for="status"><b>Trạng thái</b></label>
      <div>
        <!-- Input 1  -->
    <input type="radio" id="status_1" name="status" value=1 class="form-check-input"  required>
    <label for="status_1" class="form-check-label">Hoàn Thành</label>
      </div>
      <div>
        <!-- Input 2 -->
    <input type="radio" id="status_0" name="status" value=0 class="form-check-input" required>
    <label for="status_0" class="form-check-label">Chưa Hoàn Thành</label>
      </div>
      <!-- Nếu có -->
      @error("status")
       <span style='color:red;'>{{$message}}</span>   
      @enderror
    </div>


    @if($errors->any())
    <script>
        document.addEventListener('DOMContentLoaded', function() {
        var selectedStatus = localStorage.getItem('selectedStatus');
        if (selectedStatus) 
        {
          var radioButton = document.querySelector('input[name="status"][value="' + selectedStatus + '"]');
          if (radioButton) 
          {
            radioButton.checked = true;
          }
        }

        // Lưu trạng thái đã chọn khi người dùng thay đổi
        var radioButtons = document.querySelectorAll('input[name="status"]');
        radioButtons.forEach(function(radioButton) {
        radioButton.addEventListener('change', function() {
        if (this.checked) 
        {
          localStorage.setItem('selectedStatus', this.value);
        }
        });
      });
      });
    </script>
    @endif







  
    <!-- Địa chỉ -->
    <div class="mb-3">
      <label for="address"><b> Địa chỉ </b></label>
       <input type="text" placeholder="Nhập địa chỉ bất động sản" name="address" class="form-control" value="{{old('address')}}">
        @error("address")
         <span style='color:red;'>{{$message}}</span>   
        @enderror
    </div>

    <!-- Tên DBS -->
  <div class="mb-3">
  <label for="PropertyID"><b>Tên bất động sản</b></label>
  <!-- Để ý cái name để gọi qua data -->
  <select name="PropertyID">
      @foreach($MangChuaProperty as $item)
        <option value="{{ $item->ID }}" {{ $item->ID == old('PropertyID') ? 'selected' : '' }}>
          {{ $item->Property_Name }}
        </option>
      @endforeach
  </select>

  @error("PropertyID")
    <span style='color:red;'>{{ $message }}</span>   
  @enderror
</div>

    
    <!--Nút thêm và nút đóng form-->
    <button type="submit" class="btn">Thêm</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Thoát</button>
  </form>
                     <!-- This is the end of it -->
</filed>


</body>
    <form>
        <button class="search-button">Search</button>
        <input class="input" type="text" id="fname" name="fname">
        <button class="add-button" type="button" onclick="openForm()">Add</button>
    </form>
    
    <!-- Hiện thị thông báo thêm thành công -->
    @if(session('success_message'))
      <div id="success-message" class="alert alert-success">
        {{ session('success_message') }}
      </div>
    @endif
    
    <!--Tạo chức năng đóng / mở form-->
    <script>
      function openForm() {
        document.getElementById("myForm").style.display = "block";
      }

      function closeForm() {
        document.getElementById("myForm").style.display = "none";
      }
    </script>
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>       -->

    <!--Bảng chứa dữ liệu-->
    
      <table>
          <thead>
              <tr>
                  <th class="head">Mã</th>
                  <th class="head">Mã hợp đồng</th>
                  <th class="head">Họ tên</th>
                  <th class="head">Số CMND</th>
                  <th class="head">Tên BĐS</th>
                  <th class="head">Giá</th>
                  <th class="head">Trạng thái</th>
                  <th colspan="2"></th>
              </tr>
          </thead>
          <!-- This is where data go -->
        @foreach($MangChuaContract as $item )
          <tbody>
              <tr>
                  <td>{{   $item->ID  }}</td>
                  <td>{{ str_replace( ["N'", "'"], "", $item->Full_Contract_Code ) }}</td>
                  <td>{{ str_replace( ["N'", "'"], "", $item->Customer_Name ) }}</td>
                  <td>{{ str_replace( ["N'", "'"], "", $item->SSN ) }}</td>     
                  <td>{{ str_replace( ["N'", "'"], "", $item->Property_Name ) }}</td>
                  <td>{{ str_replace( ["N'", "'"], "", $item->Price ) }}</td>
                  <td>
                    @if($item->Status == 1)
                      Hoàn thành
                    @else
                      Chưa Hoàn Thành    
                    @endif
                  </td>
                            
                  



                  <!-- Nút bấm -->
                  <td>
                      <button type="submit">
                          <img src="/images/edit.jpg" alt="nút sửa" width="40" height="35" />
                        </button>               
                  </td>
                  
                  <td><button type="delete">
                      <img src="/images/delete.jpg" alt="nút xóa" width="40" height="35" />
                    </button>
                  </td>

              </tr>
        
          </tbody>
        @endforeach

      </table>

      

    <script>
      // Tạo hiệu ứng xuất hiện cho thông báo 
      setTimeout(function() 
     {
        document.getElementById('success-message').style.display = 'none';
      }, 5000); 
    </script>


</div> <!-- Kết thúc thẻ div nền trắng -->
</body>
</html>