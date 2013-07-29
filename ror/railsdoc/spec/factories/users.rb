FactoryGirl.define do
  factory :minhphuc86, class: Users do
	fullname "Lương Ngọc Minh Phúc"
	username "minhphuc86"
	password "t4Js40!#%^!@$"
	password_confirmation "t4Js40!#%^!@$"
  end

  factory :tranvinh, class: Users do
	fullname "Tran vinh"
	username "tran.vinh"
	password "t4Js40!#%^!@$"
	password_confirmation "t4Js40!#%^!@$"
  end

  factory :nguyenhoang, class: Users do
	fullname "Nguyen Hoang"
	username "nguyen.hoang"
	password "t4Js40!#%^!@$"
	password_confirmation "t4Js40!#%^!@$"
  end
  factory :admin, class: Users do |u|
    u.fullname 'Admin'
    u.username 'mulodovn'
    u.password 'mulodo5931'
    u.password_confirmation 'mulodo5931'
  end
end