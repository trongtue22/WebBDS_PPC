<?php

namespace App\Http\Controllers;
# import table trong database ra 
use App\Models\fullcontract;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AddFullContract extends Controller
{
    # Hàm này sẽ có tác dụng show ra các bảng hợp đồng trong DB 
    public function showFullContract()
    {
        # Lấy tất cả data trong table và nén vào trong biến -> $data_FullContract
        // $data_FullContract = fullcontract::all();
        $data_FullContract = DB::select("SELECT full_contract.Price ,full_contract.Status,full_contract.ID,full_contract.Customer_Name, full_contract.SSN, full_contract.Full_Contract_Code, full_contract.Property_ID, property.Property_Name
        from full_contract join property
        ON full_contract.Property_ID = property.ID;");
        // var_dump($data_FullContract);
        $data_Property = DB::select('SELECT * from property');
        # Chuyển flow qua trang giao diện + Đưa mảng chứa data của biến $data_FullContract qua chung
        return view( 'webPPC.maweb',['MangChuaContract' => $data_FullContract, 'MangChuaProperty' => $data_Property] );

    }

    # Hàm này giúp check các data mà người dùng nhập
    public function checkFormatContract(Request $request)
    {
        $request->validate([
            'fullName'      => 'required|min:3|max:25',
            'status'        => 'required',
            'SSN'           => 'required',
            'phoneNumber'   => 'required|regex:/^[0-9]+$/|min:6|max:10', 
            'YearOfBirth'   => 'required|before_or_equal:'.date('Y'),
            'DateContract'  => 'required|date|after:1900-01-01|before_or_equal:'.date('Y-m-d'),
            'Price'         => 'required|gte:0',
            'Deposit'       => 'required|gte:0',
            'Remain'        => 'required|gte:0',
            'address'       => 'required|min:3', 

        ],[
                'fullName.required'                 => 'Không được phép bỏ trống',
                'SSN.required'                      => 'Không được phép bỏ trống',
                'phoneNumber.required'              => 'Không được phép bỏ trống',
                'Price.required'                    =>'Không được phép bỏ trống' ,
                'YearOfBirth.required'              =>'Không được phép bỏ trống' ,
                'phoneNumber.regex'                 => 'Số điện thoại chỉ được chứa các ký tự số',
                'phoneNumber.max'                   => 'Số điện thoại phải lớn hơn 8 và nhỏ hơn 10',
                'phoneNumber.min'                   => 'Số điện thoại phải lớn hơn 8 và nhỏ hơn 10',
                'Remain.required'                   =>'Không được phép bỏ trống' ,
                'Deposit.required'                  =>'Không được phép bỏ trống' ,
                'address.required'                  =>'Không được phép bỏ trống' ,
                'YearOfBirth.before_or_equal'       => 'Vui lòng nhập năm sinh chính xác',
                'DateContract.before_or_equal'      => 'Vui lòng chọn ngày lập hợp đồng từ 1900 đến hiện tại.',
                'Deposit.gte'                       => 'Không được nhập số ấm',
                'Remain.gte'                        => 'Không được nhập số ấm',
                'Price.gte'                         => 'Không được nhập số ấm', 
                'fullName.min'                      => 'Tên chỉ được nằm trong khoảng 3 tới 25 ký tự',
                'fullName.max'                      => 'Tên chỉ được nằm trong khoảng 3 tới 25 ký tự',
                'address.min'                       => 'Địa chỉ phải nhiều hơn 3 ký tự',
        
        ]);        
        
        # Take out the data after checking 
        $validatedData = $request;
        # Plug the data into the function which will translate the data into DB 
        return $addFullContract = $this->addFullContract($validatedData);
    }

    # Hàm này giúp insert data into DB Request $request
    public function addFullContract($request)
    {
        # Khai báo các biến -> Thay đổi 

        $fullName = $request-> fullName;
        $status =   $request -> status;
        $Customer_Address =  $request -> address;
        $phoneNumber = $request -> phoneNumber; 
        $Year_Of_Birth = $request -> YearOfBirth;
        $SSN           = $request ->  SSN;
        $Property_ID   =  $request ->  PropertyID;
        $Date_Of_Contract =  $request -> DateContract;
        $Price   =  $request -> Price;
        $Deposit =  $request -> Deposit;
        $Remain  =  $request ->Remain;

        # Xử lý database -> Thay đổi 
        DB::table('full_contract')->insert([
            'Customer_Name' =>$fullName,
            'Status' =>$status,
            'Customer_Address' => $Customer_Address,
            'Mobile' => $phoneNumber,
            'SSN'    => $SSN,
            'Year_Of_Birth' => $Year_Of_Birth,
            'Property_ID' => $Property_ID,
            'Price' =>  $Price ,
            'Remain' => $Remain,
            'Deposit' =>  $Deposit,
            'Date_Of_Contract' =>  $Date_Of_Contract,
        ]);
        # Lưu biến thành công vào session() để chuyển nó qua bên trang views 
        # Biến này sẽ dc xét điều kiện để xuất hiện thông báo Thành Công  
        session()->flash('success_message', 'Thêm thành công!');

        return redirect('/web');

    }

}
