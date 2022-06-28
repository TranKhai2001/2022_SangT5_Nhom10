create database raucuqua;

CREATE TABLE user_address (
    id_address CHAR(6) NOT NULL UNIQUE PRIMARY KEY,
    id_user CHAR(6) NOT NULL,
    city_province NVARCHAR(50) NULL,
    district NVARCHAR(50) NULL,
    ward NVARCHAR(50) NULL,
    house_address NVARCHAR(100) NULL,
    phone_number NVARCHAR(15) NULL
);
create table cart(
	id_user char(6) not null,
    id_product char(6)  not null,
    c_amount_bought int4 not null
);
create table user_account(
	id_user char(6) not null unique,
    user_name nvarchar(50) not null,
	email nvarchar(50) not null,
    password nvarchar(50) not null
);
create table product(
	id_product char(6) not null unique,
    product_name nvarchar(50) not null,
    product_type nvarchar(50) not null,
    amount_bought int4 not null,
    amount_imported int4 not null,
    percent_discount int1 not null,
    price double not null,
    short_discription longtext null,
    discription longtext not null,
    img_url varchar(200) not null
);
create table blog(
	id_blog char(6) NOT NULL,
	blog_name nvarchar(1000) not NULL,
	short_discript nvarchar(255) NOT NULL,
	content longtext NOT NULL,
	author longtext NOT NULL,
	date_post datetime not NULL,
	img_url longtext not NULL
);
create table comment_blog(
	id_comment_blog char(6) not null unique,
    id_blog char(6) not null,
    father_id_blog char(6) not null,
    id_user char(6) not null,
    comment_content longtext not null,
    date_post datetime not null,
	num_like int4 not null
);
create table comment_product(
	id_comment_product char(6) not null unique,
    id_product char(6) not null,
    father_id_product char(6) not null,
    id_user char(6) not null,
	num_star int1 not null,
    comment_content longtext not null,
    date_post datetime not null
);
create table contact(
	id_contact char(6) not null unique,
    email varchar(100) not null,
    name nvarchar(100) not null,
    phone_name varchar(20) null,
    content longtext not null
);
create table bill(
	id_bill char(6) not null unique,
    id_user char(6) not null,
    address nvarchar(300) not null,
    state nvarchar(100) not null,
    total_money float8 not null,
    date_time datetime not null,
    phone_number varchar(20) not null
);
create table bill_detail(
	id_product char(6) not null,
    id_bill char(6) not null,
    amount_bought int4 not null,
    price_bought int4 not null
);
#test data.dao
INSERT INTO bill VALUES ('BI0007', 'UA0007', 'No. 354 Hung Vuong, Ward Vinh Trung, District Thanh Khe', 'Ðã thanh toán', 500000, '2021-12-12 00:00:00.000', '0135468'); 
INSERT INTO bill VALUES ('BI0008', 'UA0008', '52 Nguyen Thi Dinh, Ward Nhan Chinh, District Thanh Xuan', 'Ðã thanh toán', 2500000, '2021-12-12 00:00:00.000', '67984134684'); 
INSERT INTO bill VALUES ('BI0009', 'UA0009', '391/21 Su Van Hanh Str. ext., Ward 12, Dist.10City:   Ho Chi Minh City', 'Ðã thanh toán', 4500000, '2021-12-12 00:00:00.000', '3516451321'); 

INSERT INTO bill_detail VALUES ('PD0007', 'BI0007', 15, 15000.0000); 
INSERT INTO bill_detail VALUES ('PD0008', 'BI0007', 10, 20000.0000); 
INSERT INTO bill_detail VALUES ('PD0009', 'BI0009', 15, 450000.0000); 
/* BLOG */

INSERT INTO blog VALUES ('BL0007', N'Nước ép củ dền', N'Nước ép củ dền với vị thanh mát, ngọt dễ và dễ uống, lại cung cấp dưỡng chất cho cơ thể.', N'Chuẩn bị:
- Dền 3 củ
- Nước lọc 60 ml
- Đường vàng 2 muỗng cà phê (nếu bạn cần)
Cách làm:
- Củ dền rửa sạch, gọt vỏ, cắt thành từng miếng nhỏ
- Cho củ dền vào máy xay sinh tố cùng 60ml nước lọc, xay thật nhuyễn.
- Cho hỗn hợp ra một chiếc khăn mỏng hay rây lọc, ép lấy nước và bỏ phần xác.
- Cho đường vàng vào phần nước ép, khuấy đều cho đường tan và thưởng thức.Nước ép củ dền giúp giảm cân, làm đẹp da, ổn định huyết áp,… mang đến những lợi ích tốt cho sức khỏe cũng như sắc đẹp của bạn.
Tuy nhiên, bạn nên thận trọng và không bổ sung quá nhiều cho cơ thể nước ép củ dến. Bởi nếu sử dụng không đúng cách nó có thể gây hại cho sức khỏe. Trong quá trình sử dụng, cần chú ý:
- Những người bị sỏi thận cần hạn chế thực phẩm này
- Đối với người mới bắt đầu, chỉ nên uống một tuần 1 lần, mỗi lần khoảng nửa ly đến 1 ly nước ép nguyên chất.
- Nước ép củ dền không nên uống chung hoặc uống với thời gian gần với uống sữa. Đặc biệt, không được pha chung với sữa. Trẻ nhỏ uống theo cách này có thể gây ngộ độc, nguy hiểm đến tính mạng. Trẻ em dưới 6 tháng tuổi không nên sử dụng loại nước ép này.', N'raucuquasach24h', '2022-02-02 00:00:00.000','https://bizweb.dktcdn.net/100/435/899/files/nuoc-ep-cu-den-raucuqua24h-com.jpg?v=1630411181134'); 

INSERT INTO blog VALUES ('BL0008', N'Giảm cân với Rau Dấp cá', N'Rau diếp cá hay còn có tên gọi khác là giấp cá thuộc nhóm thực vật hàn tính (tính lạnh), có mùi thanh nhẹ hơi tanh của cá.', N'Thông thường rau diếp cá được ăn sống, ăn kèm với một số món khác hoặc làm nước uống giải nhiệt vào mùa hè.
Trong rau diếp cá chứa nhiều chất dinh dưỡng cần thiết cho cơ thể như: Protein, kali, sắt, vitamin A, B,… giúp thúc đẩy quá trình trao đổi chất, chuyển hóa năng lượng, loại bỏ mỡ thừa nhanh chóng.
Rau diếp cá là nguồn cung cấp chất xơ vô cùng dồi dào vừa có tác dụng hỗ trợ hệ tiêu hóa hoạt động tích cực vừa ngăn ngừa khả năng tích tụ chất béo, mỡ thừa tại các vùng bụng, đùi, bắp chân bắp tay, hàm lượng chất xơ trong rau diếp cá kết hợp với nước sẽ mang lại cảm giác no lâu, đẩy lùi cơn thèm ăn giúp giảm lượng thức ăn nạp vào cơ thể.
Nài ra, rau diếp cá còn có nhiều tác dụng rất tốt cho sức khỏe như: Giải nhiệt, hạ sốt, sát trùng diệt nấm, chữa bệnh trĩ, thanh lọc cơ thể, tăng cường hệ miễn dịch, làm đẹp da,
Hướng dẫn cách giảm cân bằng rau diếp cá
Uống nước rau diếp cá giảm cân: là cách giảm cân phổ biến, quen thuộc. Không chỉ hỗ trợ loại bỏ chất béo, ngăn ngừa tích tụ mỡ thừa mà còn giúp giải nhiệt, thanh lọc cơ thể hiệu quả.
Cách làm nước rau diếp cá cũng rất đơn giản, dễ thực hiện:
- Rửa sạch rau diếp cá với nước muối khoảng 15 phút
- Cho rau diếp cá và 100ml nước vào máy xay sinh tố nghiền nhuyễ
- Sau đó lọc lấy phần nước và loại bỏ bã
- Để cốc nước rau diếp cá trong tủ lạnh 30 – 40 phút rồi uống sẽ nn hơn
Salad rau diếp cá thịt tôm: bạn hãy kết hợp ăn rau diếp cá cùng một số thực phẩm ít calo, chất béo như tôm, thịt lợn nạc,…
Cách chế biến salad rau diếp cá giảm béo:
- Thịt lợn, tôm luộc chín rồi thái thành miếng nhỏ vừa ăn
- Rau diếp cá rửa sạch, để ráo nước
- Cho rau diếp cá vào bát tô to, bỏ thêm gia vị ớt, chanh, bột nêm, nước mắm rồi trộn đều
- Để trong khoảng 15 – 20 phút cho gia vị ngấm vào rau
- Sau đó, cho thịt lợn và tôm vào bát tô trộn cùng rau diếp cá và thưởng thức
Lưu ý khi giảm cân bằng rau diếp cá tại nhà
Tuy phương pháp giảm cân bằng cây rau diếp cá an toàn, dễ thực hiện nhưng hiệu quả còn phụ thuộc vào cách áp dụng, liều lượng cụ thể của mỗi người.
- Rau diếp cá được ăn sống vì sẽ giữ đầy đủ được chất dinh dưỡng và công dụng giảm cân tốt hơn khi đã làm chín.
- Nên rửa sạch sẽ trước khi ăn để đảm bảo an toàn cho sức khỏe.
- Uống – ăn rau diếp cá giảm cân với liều lượng vừa phải 3 – 4 lần/tuần.
- Tránh lạm dụng quá nhiều sẽ dẫn đến tình trạng chóng mặt, nôn nao do cơ thể không thích nghi kịp
- Nên uống nước rau diếp cá trước các bữa ăn chính 30 phút – 1 tiếng hoặc trước khi đi ngủ 1 – 2 tiếng sẽ phát huy công dụng giảm cân tốt hơn
- Xây dựng thực đơn giảm cân với rau diếp cá khóa học, kết hợp với các thực phẩm ít chất béo, nhiều chất xơ và nước ép hoa quả để đảm bảo đủ năng lượng cho cơ thể hoạt động
- Kết hợp tập luyện thể dục thường xuyên 30 – 40 phút/ngày
- Bổ sung đầy đủ nước cho cơ thể 2 – 2,5 lít/ngày
- Kiên trì thực hiện chế độ ăn giảm béo từ  rau diếp cá trong thời gian dài mới có tác dụng', N'raucuquasach24h', '2022-02-02 00:00:00.000','https://bizweb.dktcdn.net/100/435/899/files/giam-can-voi-rau-dap-ca-hoamau24h-com.jpg?v=1630406868158'); 

INSERT INTO blog VALUES ('BL0009', N'<h1>Các loại rau củ quả giúp </h1>thanh lọc cơ thểCơ thể chúng ta hằng ngày phải nạp năng lượng nhằm duy trì các hoạt động, trong quá trình nạp thức ăn vào cơ thể vô hình chung cũng nạp vào một lượng chất độc ', N'Cơ thể chúng ta hằng ngày phải nạp năng lượng nhằm duy trì các hoạt động, trong quá trình nạp thức ăn vào cơ thể vô hình chung cũng nạp vào một lượng chất độc ', N'Củ cải đỏ được coi là một trong những siêu thực phẩm vì nó có nhiều lợi ích sức khỏe.
Được ví như một tiểu nhân sâm chứa rất nhiều chất dinh dưỡng có lợi cho sức khỏe, chứa nhiều sắt, vitamin C, folic, phốt pho, magiê và B6... Đặc biệt chứa thành phần beta cyanin giúp giải độc gan và thanh lộc độc tố cho gan rất tốt. Các vi chất có trong củ cải đỏ giúp trung hòa các độc tố và đào thải dần dần ra nài, giải độc cơ thể hiệu quả. Bên cạnh đó, củ cải đỏ có tính mát nên cũng được sử dụng làm thực phẩm thanh nhiệt.
Bạn lưu ý củ cải đỏ tốt nhưng chỉ nên ăn một lượng vừa phải tránh trường hợp ăn quá nhiều gây ra những tác dụng phụ không tốt cho cơ thể: Buồn nôn, tiêu chảy, hạ huyết áp, giảm hàm lượng canxi của cơ thể và ảnh hưởng cổ họng.
Cải xoăn ( cải kale) là thực phẩm rất tốt cho cơ thể. Vốn dĩ cải xoăn là chất xơ và nước nên thanh lọc chất độc cơ thể rất hiệu quả. Đặc biệt cải xoăn ảnh hưởng rất tích cực đến hệ tiêu hóa của cơ thể, ăn cải xoăn có thể ngăn ngừa táo bón rất tốt. Nài ra, cải xoăn còn là thực phẩm cung cấp vitamin C, K, omega 3, omega 6, folate, lutein, zeaxanthin, beta- carotene, flavonoid và polyphenol... Đặc tính giải độc cơ thể và giữ cho gan khỏe mạnh của cải xoăn cũng rất được đề cao.rong cải xoăn chứa rất nhiều chất chống oxy hóa như: Carotenoid, flavonoid ngăn ngừa sự phát triển của tế bào ung thư. Nài ra còn làm tăng lượng sắc tố trên da, bảo vệ da chống lại ánh nắng Mặt Trời và làm giảm nguy cơ thoái hóa da, giúp trẻ hóa làn da.
Cà rốt có thể chế biến khá nhiều món ăn hay thức uống tốt cho sức khỏe. Cà rốt chứa beta- carotene, lutein, zeaxanthin, vitamin A, K, B... giúp cơ thể phòng chống rất nhiều bệnh. Cà rốt khi ép nước và uống hằng ngày chúng ta có thể thanh lọc độc tố cho gan, làm mát gan, làm đẹp da.Cà rốt chứa khoảng 87% nước và có khả năng giải độc mạnh mẽ. Chúng giúp làm giảm nguy cơ hình thành sỏi thận và đào thải chất độc ra khỏi cơ thể.
Khi chúng ta già mức năng lượng của chúng ta bắt đầu suy giảm. Thay vì uống những thức uống có lượng đường cao, bạn có thể chọn nước ép cà rốt để thay thế. Nó sẽ giúp năng lượng cơ thể bạn tăng lên nhanh chóng.
Nhiều người béo phì hay muốn giảm cân thì hãy dành thời gian tự thưởng cho mình mỗi ngày 1- 2 ly nước ép cà rốt nhé. Nước ép giúp đốt cháy lượng mỡ rất tốt. Nếu kết hợp với một chế độ ăn kiêng hợp lý chúng ta sẽ có một vóc dáng đáng mơ ước.
Dưa leo là thực phẩm chứa rất nhiều nước. Khi kết hợp dưa chuột với các loại rau củ khác sẽ tăng khả năng thanh lọc độc tố cho cơ thể qua hệ bài tiết. Đặc biệt, lượng nước có trong dưa leo sẽ kích thích quá trình bài tiết độc tố xảy ra nhanh hơn, cơ thể loại bỏ chất dư thừa một cách tối ưu.
Dưa leo chứa các chất chống oxy hóa như: Carotenes, vitamin C, vitamin A, Zea- xanthin và Lutein trợ giúp cơ thể chống lại các gốc tự do và các loài ôxy phản ứng (ROS)- đóng một vai trò trong quá trình lão hóa và gây ra bệnh tật khác nhau. Dưa leo cũng có nhiều vitamin K có vai trò quan trọng trong việc duy trì sức mạnh của xương. Dưa leo còn giúp lợi tiểu, kiểm soát quá trình tăng cân và huyết áp cao.', N'raucuquasach24h', '2022-02-02 00:00:00.000','https://bizweb.dktcdn.net/100/435/899/files/rau-cu-qua-thanh-loc-co-the-hoamau24h-com.jpg?v=1630400493253'); 

/* CART */
INSERT INTO cart VALUES ('UA0007', 'PD0007', 15); 
INSERT INTO cart VALUES ('UA0008', 'PD0008', 30); 
INSERT INTO cart VALUES ('UA0009', 'PD0009', 45); 

INSERT INTO comment_blog VALUES ('CB0007', 'BL0001', 'NULL', N'GA', N'Cảm ơn shop nhiều', '2021-12-16 00:00:00.000', 5); 
INSERT INTO comment_blog VALUES ('CB0008', 'BL0001', 'NULL', N'Tài', N'Bài viết hay quá, phải mua mới được', '2021-12-16 00:00:00.000', 4); 
INSERT INTO comment_blog VALUES ('CB0009', 'BL0002', 'NULL', N'Khoa', N'Tôi muốn đặt một lô hàng lơn', '2021-12-16 00:00:00.000', 4); 
INSERT INTO comment_product VALUES ('CP0007', 'PD0007', 'NULL', N'BaDao', 4, N'Sản phẩm cũng ổn, mỗi tội không thích khâu giao hàng lắm', '2021-12-12 00:00:00.000'); 
INSERT INTO comment_product VALUES ('CP0008', 'PD0007', 'CP0007', N'Dao', 4, N'Ông chỉ được cái bốc phét', '2021-12-15 00:00:00.000'); 
INSERT INTO comment_product VALUES ('CP0009', 'PD0008', 'NULL', N'Meo', 5, N'Quá chất lượng', '2021-05-16 00:00:00.000'); 

INSERT INTO contact VALUES ('CT0007', 'huudao@gmail.com', N'Dao', '5498432165', N'Đỉnh quá shop ơi. Tôi không có thắc mắc gì cả '); 
INSERT INTO contact VALUES ('CT0008', 'badao@gmail.com', N'badao', '5168498465', N'Hàng bị hư , tôi muốn được đổi'); 
INSERT INTO contact VALUES ('CT0009', 'sieunhan@gmail.com', N'Nhan', '6546849813', N'Tôi có nhu cầu mua một số lượng lớn mặt hàng rau củ quả'); 
INSERT INTO product VALUES ('PD0007', N'Bắp Cải Tím Hữu Cơ - 500g', N'Rau củ', 0, 100, 20, 20000.0000, N'Bắp cải thường được chế biến bằng cách luộc, hoặc xào, làm salad, cuốn thịt hoặc làm gỏi', N'Bắp cải tím: tên khoa học là Brassica oleracea var capitata ruba là cây bắp cải có màu tím. Xuất xứ từ Địa Trung Hải, hiện nay được trồng rộng rãi khắp thế giới, thích hợp với khí hậu ôn đới và tại Việt Nam bắp cải tím được trồng nhiều ở Đà Lạt. • Sở dĩ bắp cải tím có màu như vậy là vì nó có hàm lượng cao polyphenol anthocyanin, chất này có tính kháng viêm, bảo vệ tế bào khỏi những tổn hại của tia cực tím và có thể giúp giảm nguy cơ mắc một số bệnh ung thư. • Đặc biệt, lượng vitamin C trong bắp cải tím gấp 6-8 lần so với bắp cải xanh, đồng thời chứa nhiều chất dinh dưỡng thực vật hơn bắp cải xanh. Cách sử dụng: Bắp cải thường được chế biến bằng cách luộc, hoặc xào, làm salad, cuốn thịt hoặc làm gỏi. (Các cách chế biến tham khảo mục món nn) Cách bảo quản: Khi mua về mà chưa dùng, bạn không rửa bởi khi dính nước nó sẽ nhanh hỏng, hãy để trong túi nhựa và cất ở ngăn mát của tủ lạnh (được khoảng 1 tuần). Nếu dùng một lần không hết cả cái, bạn có thể giữ phần bắp cải còn lại bằng cách vẩy lên một ít nước rồi cho vào túi nhựa và cất trong tủ lạnh.', 'https://product.hstatic.net/200000423303/product/bap-cai-tim-huu-co_203f203060064cf5a24b9f8e9c352214_grande.jpg'); 
INSERT INTO product VALUES ('PD0008', N'Bắp Cải Trắng Hữu Cơ - 700g', N'Rau củ', 0, 100, 25, 77000.0000, N'Trong bữa ăn gia đình, bắp cải được các bà nội trợ biến hóa thành nhiều món ăn nn. Bắp cải luộc thơm ngọt vị gừng, bắp cải xào cà chua thanh mát, dưa bắp cải muối giòn rụm, chấm cùng nước mắm cay thật nn miệng.', N'Trong bữa ăn gia đình, bắp cải được các bà nội trợ biến hóa thành nhiều món ăn nn. Bắp cải luộc thơm ngọt vị gừng, bắp cải xào cà chua thanh mát, dưa bắp cải muối giòn rụm, chấm cùng nước mắm cay thật nn miệng. Cầu kỳ hơn, nhiều người còn làm gỏi bắp cải, bắp cải cuốn thịt bằm nấu canh. Nhiều người mới chỉ biết bắp cải là loại rau lành, mát, dễ ăn mà chưa biết hết những giá trị y học quý giá của nó. Loại rau dẫn đầu trong các loại rau họ cải này chứa một nguồn dinh dưỡng rất cao: khoảng 90% nước, 1,8% đạm, 5,4% chất bột đường, 1,6% chất xơ và nhiều khoáng chất, vitamin quý như can-xi, phốt-pho, sắt, vitamin C, B1, B2… Với ưu thế đó, người dân đã đưa bắp cải vào làm đẹp, dinh dưỡng và chữa bệnh. Cách đây hơn 60 năm, các nhà nghiên cứu đã phát hiện trong bắp cải tươi có chứa một chất gọi là vitamin U và sau đó, người ta dùng lá bắp cải tươi để làm thuốc điều trị loét, viêm dạ dày và ruột. Tuy nhiên vitamin U là chất không bền vững, tan trong nước, dễ oxy hóa và bị hủy hoại ở nhiệt độ cao. Vì thế, để chữa bệnh, các thầy thuốc Đông y không khuyến khích việc chế biến rau quá kỹ. Muốn tận dụng tối đa vitamin U, bạn nên dùng dưới dạng nước ép rau tươi là tốt nhất. Không chỉ tốt cho người bị loét dạ dày, giới nghiên cứu còn công nhận bắp cải có khả năng chống ung thư vú, ung thư ruột kết. Tác dụng tuyệt vời này là do trong rau bắp cải có chứa chất chống ung thư như sulforaphane, phenethyl isothiocyanate và indole – 3 – carbinol. Tuy nhiên, bạn lưu ý, bắp cải có thể gây bướu cổ. Do đó, người bị rối loạn tuyến giáp hoặc bướu cổ không nên ăn uống nhiều bắp cải. Nài ra, những người suy thận nặng, phải chạy thận nhân tạo cũng không nên dùng. Hiện nay, với quy trình trồng trọt hiện đại, bắp cải đã có mặt quanh năm trên các sạp rau ở chợ, trong siêu thị. Bạn có thể dễ dàng mua và chế biến theo nhiều cách để phù hợp với khẩu vị gia đình. Để phòng tránh rau nhiễm hóa chất, bạn nên mua rau của các cơ sở cung cấp rau an toàn. Nài ra, trước khi chế biến dưới bất kỳ hình thức nào, bạn nên tách từng lá, rửa sạch và ngâm với nước muối khoảng 15 phút. Bạn nên ăn bắp cải ít nhất hai lần/tuần. Kinh nghiệm cho bạn Bắp cải nn thường cuộn chặt, lá bóng, lõi tươi, chắc tay. Bắp cải kém chất lượng có nhiều lá vàng, lõi bị nứt và ngửi thấy mùi hôi, úa. Bạn không nên để bắp cải quá lâu vì rau dễ bị khô, cứng. Bắp cải nguyên bảo quản trong tủ lạnh nên dùng trong khoảng 1 tuần. Bắp cải đã cắt miếng nên dùng trong vòng hai ngày sau khi cắt.', 'https://product.hstatic.net/200000423303/product/bap-cai-huu-co_203a09f5391b4cb59bbad82f94c1cd7d_grande.jpg'); 
INSERT INTO product VALUES ('PD0009', N'Cải Bẹ Xanh Hữu Cơ - 300g', N'Rau củ', 0, 100, 25, 50000.0000, N'Cải bẹ xanh có thân to, nhỏ khác nhau, lá có màu xanh đậm hoặc xanh nõn lá chuối.', N'Cải bẹ xanh có thân to, nhỏ khác nhau, lá có màu xanh đậm hoặc xanh nõn lá chuối. Lá và thân cây có vị cay, đăng đắng thường dùng phổ biến nhất là nấu canh, hay để muối dưa (dưa cải). Thời gian thu hoạch cho cải bẹ xanh trong khoảng từ 40 – 45 ngày. Thành phần dinh dưỡng trong cải bẹ xanh gồm có: vitamin A, B, C, K, axit nicotic, catoten, abumin…, nên được các chuyên gia dinh dưỡng khuyên dùng vì có nhiều lợi ích đối với sức khỏe cũng như có tác dụng phòng chống bệnh tật. Theo Đông y Việt Nam, cải bẹ xanh có vị cay, tính ôn, có tác dụng giải cảm hàn, thông đàm, lợi khí... Riêng hạt cải bẹ xanh, có vị cay, tính nhiệt, không độc, trị được các chứng phong hàn, ho đờm, hen, đau họng, tê dại, mụn nhọt.. ', 'https://product.hstatic.net/200000423303/product/cai-be-xanh_0f8c123b3652406393a0be1e87319e35_grande.jpg'); 
INSERT INTO user_account VALUES ('UA0007', N'huudao', 'huudao718@gmail.com', 'daohuu'); 
INSERT INTO user_account VALUES ('UA0008', N'meomeo', 'meomeo@gmail.com', 'meomeo'); 
INSERT INTO user_account VALUES ('UA0009', N'gaga', 'gaga@gmail.com', 'gaga'); 
INSERT INTO user_address VALUES ('AD0007', 'UA0007', N'Đắc Lắc', N'Krong Pắc', N'Vụ bổn', N'556', '56543165465'); 
INSERT INTO user_address VALUES ('AD0008', 'UA0008', N'Nghệ An', N'Quận 8', N'Linh trung', N'4845', '13452156565'); 
INSERT INTO user_address VALUES ('AD0009', 'UA0009', N'Thủ Đức', N'Thủ Đức ', N'Linh Chiểu', N'654', '35468461354'); 

/* khai insert */
/* user address */
INSERT INTO user_address VALUES ('AD0001', 'UA0001', N'Hồ Chí Minh', N'quận Thủ Đức', N'phường Linh Xuân', N'152/1', '0901197448'); 
INSERT INTO user_address VALUES ('AD0002', 'UA0002', N'Đồng Nai ', N'huyện Trảng Bom', N'xã Bắc Sơn', N' 157', '0938042412'); 
INSERT INTO user_address VALUES ('AD0003', 'UA0003', N'Hải Phòng', N'quận Hồng Bàng', N'phường Phạm Hồng Thái ', N'156', '0934091022'); 
/* user_account */
INSERT INTO user_account VALUES ('UA0001', N'TrKih', 'trankhai@gmail.com', '12345'); 
INSERT INTO user_account VALUES ('UA0002', N'KihTr', 'khaitran@gmail.com', '12345'); 
INSERT INTO user_account VALUES ('UA0003', N'QKhai', 'khaiquaq@gmail.com', '12345'); 
/* cart */
INSERT INTO cart VALUES ('UA0001', 'PD0001', 1); 
INSERT INTO cart VALUES ('UA0002', 'PD0002', 2); 
INSERT INTO cart VALUES ('UA0005', 'PD0005', 5); 
/* comment_blog */
INSERT INTO comment_blog VALUES ('CB0001', 'BL0001', 'null', N'Trầ', N'Tim', '2022-04-10 12:31:05.000', 5); 
INSERT INTO comment_blog VALUES ('CB0002', 'BL0002', 'null', N'Khả', N'Mhiều tim', '2021-05-28 12:31:47.000', 5); 
INSERT INTO comment_blog VALUES ('CB0003', 'BL0003', 'null', N'aq', N'Rất nhiều tim', '2020-06-25 12:32:39.000', 5); 
/* bill*/
INSERT INTO bill VALUES ('BI0001', 'UA0001', N'Đồng Nai', N'Đã thanh toán', 100000, '2020-09-09 09:35:16.000', '0901197448'); 
INSERT INTO bill VALUES ('BI0002', 'UA0002', N'Hải Phòng', N'Đã thanh toán', 200000, '2021-11-08 08:03:00.000', '0938042412'); 
INSERT INTO bill VALUES ('BI0003', 'UA0005', N'Cà Mau', N'Đã thanh toán', 300000, '2022-05-09 07:00:30.000', '01656553313'); 
/* bill detail */
INSERT INTO bill_detail VALUES ('PD0001', 'BI0001', 1, 100000); 
INSERT INTO bill_detail VALUES ('PD0002', 'BI0002', 2, 200000); 
INSERT INTO bill_detail VALUES ('PD0003', 'BI0003', 3, 300000); 
/* comment product */
INSERT INTO comment_product VALUES ('CP0001', 'PD0001', 'null', N'hải', 1, N'Good', '2019-06-24 08:19:04.000'); 
INSERT INTO comment_product VALUES ('CP0002', 'PD0002', 'null', N'Krần', 2, N'OK la', '2020-12-17 09:19:50.000'); 
INSERT INTO comment_product VALUES ('CP0003', 'PD0003', 'null', N'uanq', 3, N'Được của ló', '2021-01-30 10:20:24.000'); 
/* contact */
INSERT INTO contact VALUES ('CT0001', 'trankhai@gmail.com', N'Trần Khải', '0901197448', N'Tại sao hàng lại khác xa hình thế'); 
INSERT INTO contact VALUES ('CT0002', 'khaitran@gmail.com', N'Khải Trần','0938042412', N'Tôi có đặt hàng mà sao lâu quá vẫn chưa nhận được'); 
INSERT INTO contact VALUES ('CT0003', 'khaiquaq@gmail.com', N'Khải Quaq', '0934091022', N'Shop giao nhầm hàng rồi.'); 
/*product*/
INSERT INTO product VALUES ('PD0001', N'Chanh vàng', N'Rau củ quả gia vị', 0, 100, 10, 7000, N'Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.', 
N'Chanh vàng sử dụng tạo mùi hương trong nấu ăn, làm bánh.Vỏ chanh sử dụng tạo mùi thơm cho các món bánh quy.Nước chanh chua dịu, không bị đắng ở nhiệt cao như chanh xanh 4-5 quả/1kg.',
'https://product.hstatic.net/1000400508/product/1395_d2b7f0d605464c7abab28b1f7a028560_028ae119de4e4d1bbc37a79dadc8d253_6f480acb442c4bf2a97d66f28a4a3353_grande.jpg');
INSERT INTO product VALUES ('PD0002', N'Táo', N'Trái cây', 0, 100,20,70000, N'Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.', 
N'Táo được biết đến là loại trái cây có nhiều vitamin và khoáng chất. Táo cung cấp nhiều vitamin C cho cơ thể. Loại vitamin này là chất chống oxy hóa phổ biến trong trái cây.',
'https://media-cdn.laodong.vn/Storage/NewsPortal/2021/4/6/896286/Qua-Tao-1.jpg');
INSERT INTO product VALUES ('PD0003', N'Khoai lang Nhật(Đà Lạt)', N'Rau củ', 0, 100, 3,28000, N'Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.', 
N'Khoai lang giống Nhật nguồn gốc Đà Lạt sở hữu các đặc điểm như củ to dài, vỏ ngoài màu tím và ruột màu vàng đậm. Với vị ngọt bùi, khoai lang giống Nhật là món ăn nhẹ rất ngon miệng và được dùng để làm nguyên liệu cho nhiều món ăn. Luộc, hấp, nấu chè, nấu ca ri đều rất dẻo và ngon.',
'https://product.hstatic.net/1000282430/product/upload_81f54e2c7066430e9de51e5576bd933d_large.jpg');
/* blog */
INSERT INTO blog VALUES ('BL0001', N'Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”', N'Tuyệt đối không rửa rau, củ, quả trước khi mang đi cất trữ. Điều đó sẽ khiến rau, củ, quả dễ bị ủng, thối...',
N'1. Tuyệt đối không rửa rau, củ, quả trước khi mang đi cất trữ.Điều đó sẽ khiến rau, củ, quả dễ bị ủng, thối. Bạn chỉ cần lau qua bằng giấy ăn hoặc khăn khô là được.
2. Không nên để rau, củ, quả trong môi trường ẩm ướt bởi như vậy sẽ khiến chúng nhanh hỏng.Các bạn nên đặt giấy ăn khô và những chiếc túi hay hộp bảo quản rau, củ, quả.
3. Tuyệt đối không cho các loại rau quả này vào tủ lạnh!Ớt chuông, dưa chuột, cà chua cần được bảo quản ở nhiệt độ phòng, nếu không chúng sẽ nhanh hỏng và dễ mất chất.
4. Rau, củ, quả đã cắt hoặc gọt vỏ cần cho vào hộp kín.Như vậy sẽ khiến cho thực phẩm của bạn giữ được lâu hơn và hạn chế tình trạng mất chất.
5. Không nên để rau, củ, quả ở nhiệt độ quá lạnh.Đừng nghĩ rằng điều đó sẽ giúp bảo quản lâu hơn, trái lại nó còn khiến thực phẩm của bạn nhanh hỏng hơn khi rã đông đó.
6. Một số loại rau quả không nên để cùng nhau.Chúng ta không nên để chung chuối, quả mơ, dưa hấu, lê, mận, xoài, và cà chua với một trong các loại rau quả bao gồm táo, cà tím, dưa hấu, khoai tây, bí ngô, cà rốt và bông cải xanh. Điều đó sẽ khiến rau quả của bạn nhanh bị hỏng.
7. Muốn bảo quản rau củ ở nhiệt độ phòng, hãy để chúng ở vị trí thông thoáng.Tránh cho vào hộp hay túi nilon ở nhiệt độ thường, như vậy thực phẩm sẽ nhanh bị ủng, thối…
8. Muốn giữ nho tươi lâu, hãy cho vào túi polyetylen hoặc hộp nhựa.Với nho hay cherry, bạn nên cho vào túi polyetylen hoặc hộp nhựa rồi đặt vào tủ lạnh.
9. Không nên cho chuối vào tủ lạnh.Thay vào đó, các bạn hãy để ở nhiệt độ phòng và bọc phần cuống lại bằng màng bọc thực phẩm.'
, N'brightside', '2021-08-10 11:26:32.000', 
'https://file.hstatic.net/200000384647/article/tieu_de_1_430c351d959d4354955ee7c0ff480153.jpg');
INSERT INTO blog VALUES ('BL0002', N'11 lý do khuyên bạn nên thường xuyên ăn dâu tây”',N'Khi nhắc đến dâu tây, chắc hẳn ai cũng biết rõ về những lợi ích sắc đẹp mà loại thực phẩm này mang lại...',
N'1. Tăng cường hệ miễn dịch
2. Bảo vệ mắt
3. Phòng chống ung thư
4. Ngăn ngừa các nếp nhăn
5. Đánh bại cholesterol có hại
6. Hạn chế viêm nhiễm
7. Điều chỉnh huyết áp
8. Tăng cường chất xơ
9. Kiểm soát cân nặng
10. Hỗ trợ cho sức khỏe tiền sinh sản
11. Viên thuốc trị gút mới', 
N'L.Phạm (th)', '2022-06-11 11:26:32.000', 
'https://thucpham.com/wp-content/uploads/2016/12/loi-ich-cua-dau-tay-1.jpg');
INSERT INTO blog VALUES ('BL0003', N'4 điều sẽ xảy ra nêu bạn không chịu ăn rau',N'Chắc các bạn cũng đã nghe giảng giải quá nhiều về lợi ích của việc ăn rau đúng không? Tuy nhiên, có vẻ như những bài giảng này...',
N'1. Cơ thể yếu thảm hại
Nếu không ăn rau, hẳn nhiên cơ thể ta sẽ có chút khác lạ bởi rau, củ, quả chính là nguồn bổ sung rất nhiều vitamin như vitamin A, B, C, E, K và các loại khoáng chất cho cơ thể.
Về cơ bản, các vitamin sẽ có tác dụng điều hòa sinh lý cơ thể (vitamin E), hỗ trợ tốt cho mắt (vitamin A), tăng tốc độ phục hồi vết thương (vitamin C), chống lão hóa (vitamin B), thậm chí là chống cả ung thư (vitamin K).
Do đó, thiếu hụt vitamin sẽ khiến bạn đối mặt với nhiều mối lo sức khỏe ở xương, tâm sinh lý, hay cả bệnh tim mạch.
Ngoài ra, các loại rau xanh hầu hết đều có chứa hàm lượng sắt cao – một trong các yếu tố tạo máu. Vì thế, thói quen không ăn rau sẽ dẫn đến nhiều bệnh lý liên quan đến thiếu máu, hạ đường huyết, khiến chúng ta choáng ngất, thậm chí là nguy hiểm đến tính mạng.
2. Ăn ít đi nhưng vẫn tăng cân vù vù
Tại sao lại vậy? Đó là vì rau củ quả và trái cây có chứa nhiều nước, khiến bạn có cảm giác no nhanh. Thêm vào đó, đây là các loại thực phẩm mật độ năng lượng thấp nhất, chỉ khoảng 0-1,5 calorie/gram so với các thực phẩm khác có tới 4-9 calorie/gram.
Việc bỏ qua một lượng lớn rau hàng ngày sẽ khiến bạn buộc phải bù đắp bằng các thực phẩm giàu năng lượng hơn. Chính vì thế, dù có thể thoạt trông bạn đang ăn ít hơn, nhưng lượng calorie nạp vào lại nhiều hơn rất nhiều lần và hệ quả là bạn… béo lên.
3. Thảm họa khi… đi cầu
Rau củ quả có chứa nhiều chất xơ – thành phần rất có lợi cho đường tiêu hóa.
Các loại thức ăn thông thường khi vào trong dạ dày sẽ bị hòa tan và thu gọn thể tích. Tuy nhiên, để thức ăn tiêu hóa di chuyển qua đường ruột nhanh và dễ dàng hơn, chúng ta cần tập hợp một lượng lớn thức ăn.
Đây sẽ là lúc rau củ quả phát huy tác dụng. Khác với các loại thức ăn thông thường, chất xơ không bị phân giải trong quá trình tiêu hóa.
Nhờ đó, thức ăn tiêu hóa sẽ có thể tích lớn hơn, góp phần kích thích “nhu động ruột” (chuyển động co bóp của ruột để đưa thức ăn đi).
Vì vậy nếu như loại bỏ rau ra khỏi chế độ ăn, việc “đi cầu” sẽ thực sự trở thành thảm họa đối với bạn. Ngoài ra, theo viện Y tế quốc gia Mỹ, việc táo bón lâu ngày có thể gây bệnh trĩ, hoặc viêm ruột thừa.
Trĩ sẽ gây nhiều bất tiện và đau đớn trong cuộc sống hàng ngày, còn viêm ruột thừa nếu không được chữa trị kịp thời có thể khiến bạn tử vong.
4. Nguy cơ đau tim tăng mạnh
Việc thiếu chất xơ cũng khiến bạn tăng nguy cơ bị các chứng bệnh về tim mạch.
Cụ thể, theo một nghiên cứu vào năm 2011 trên tạp chí Circulation về sự liên hệ giữa việc ăn ít rau và bệnh tim, kết quả cho thấy những người ăn ít rau từ bé có nguy cơ bị bệnh xơ vữa động mạch khi về già.
Ngoài ra, nghiên cứu còn chỉ ra rằng những người ăn nhiều rau thì tỷ lệ bệnh tim mạch và các bệnh liên quan sẽ ở mức thấp.
Ngược lại, những người không ăn rau và dung nạp nhiều chất béo thì có khả năng cao bị nghẽn mạch máu, dẫn đến các cơn đau tim và đột quỵ.',
N'Livestrong, Healthy Eating', '2022-10-05 11:26:32.000', 
'https://media.dautuvietnam.com.vn/thumb_x800x/2021/01/13/9770/1610508368-gia-rau-cu-qua-hom-nay-131-len-ke-gia-tot.jpg');

/* thuan */
/* user address */
INSERT INTO user_address VALUES ('AD0004', 'UA0003', N'Hồ Chí Minh', N'quận 3', N'phường 123', N'housse 1', '0123456799'); 
INSERT INTO user_address VALUES ('AD0005', 'UA0003', N'Đồng Nai ', N'quận 7', N'phường trong quận 7', N' house trong phường', '0987654399'); 
INSERT INTO user_address VALUES ('AD0006', 'UA0005', N'Cà Mau ', N'huyện trong cà mau', N'phường của cà mau', N'house trong cà mau', '0749473947'); 
/* user_account */
INSERT INTO user_account VALUES ('UA0004', N'thuanPham', 'thuan0373535@gmail.com', '12345'); 
INSERT INTO user_account VALUES ('UA0005', N'thejavax', 'hhji@gmail.com', 'jdk7');
INSERT INTO user_account VALUES ('UA0006', N'sql', 'sql@gmail.com', 'sql123');
/* product */
INSERT INTO product VALUES ('PD0004', N'500G BẮP CẢI ĐÀ LẠT', N'rau củ', 10, 100, 0, 19000.0000, N'Bắp cải có thể ăn sống, hấp, luộc, xào hoặc nhồi, thêm vào các món salad hoặc xà lách trộn.', N'Bắp cải có thể có nhiều màu từ xanh lá cây đến đỏ và tím và lá có thể nhẵn hoặc nhăn nheo. Bắp cải có thể được ăn sống, hấp, luộc, xào hoặc nhồi, có thể sử dụng bắp cải để thêm vào các món salad hoặc xà lách trộn.

Khi lựa chọn bắp cải đảm bảo các lá căng và chắc vì lá lỏng lẻo cho thấy bắp cải già hơn. Bảo quản bắp cải trong tủ lạnh đến 2 tuần.

Thành phần dinh dưỡng của 1 nửa chén bắp cải nấu chín cắt nhỏ (75 gram) chứa: 17 calo, 4 gam carbohydrate (trong đó có chứa 2 gam đường và 1 gam chất xơ), 1 gam protein.

Ăn nửa chén bắp cải nấu chín sẽ cung cấp 30-35% nhu cầu vitamin C hàng ngày và, 81,5 microgam vitamin K, 11 miligam magiê, 22 microgam folate, Vitamin B-6, canxi, kali và thiamin nhưng ít hơn.

Bắp cải có nhiều chất xơ và chứa chất chống oxy hóa mạnh, bao gồm polyphenol và các hợp chất lưu huỳnh.', 'https://bizweb.dktcdn.net/thumb/grande/100/435/899/products/f211a408-56ae-4e42-a2f0-056a8bcd4913.jpg?v=1630325178290');
INSERT INTO product VALUES ('PD0005', N'0,5KG BÍ ĐAO XANH', N'rau củ', 10, 100, 0, 23000.0000, N'Mô tả đang cập nhật', N'- Sản phẩm được sản xuất theo tiêu chuẩn an toàn có kiểm soát, Vietgap, xu hướng hữu cơ tại các farm liên kết ở Đà Lạt, Tây Nguyên, Ninh Thuận, Đồng Nai, và các tỉnh miền Tây.

- Một số sản phẩm được sơ chế, đóng gói, giao trong ngày.

- Thu hoạch và tới tay người tiêu dùng trong thời gian ngắn nhất. Thường sau 12 - 24h đặt hàng.', 'https://bizweb.dktcdn.net/thumb/grande/100/435/899/products/62728429-d51b-4c18-991a-4f233e00f356.jpg?v=1630325235993');
INSERT INTO product VALUES ('PD0006', N'500G BẮP CẢI TÍM', N'rau củ', 20, 100, 0, 23000.0000, N'Mọi người dường như đã quá quen thuộc với những quả bắp cải xanh nhưng ít người biết rằng, bắp cải còn có loại màu tím bắt mắt. ', N'Là một loại thực phẩm vô cùng quen thuộc, có màu sắc vô cùng bắt mắt, rất dễ mua và chế biến thành nhiều món ăn đa dạng khác nhau trong bữa cơm hằng ngày.  Bắp cải tím đặc biệt mang đến lợi ích trong việc hỗ trợ phòng chống ung thư, giúp cơ thể khỏe mạnh toàn diện.', 'https://cdn.tgdd.vn/Products/Images/8785/222870/bhx/bap-cai-tim-tui-1kg-202012022316572858.jpg');
/* blog */
INSERT INTO blog VALUES ('BL0004', N'Chúng ta Ăn trái cây thay rau có được không ?', N'Rau và trái cây đều cung cấp chất xơ và Vitamin, và hương vị của trái cây cũng dễ ăn hơn rau. Vậy có thể ăn trái cây thay thế rau được không ? Việc này những tưởng là tốt nhưng lại không tốt chút nào.', N'Trái cây rất tốt cho sức khỏe nhưng việc dùng trái cây thay thế hoàn toàn rau xanh hàng ngày trong khẩu phần ăn là không tốt, cũng như phản khoa học.



Bởi rau xanh có công dụng cung cấp vitamin, chất xơ và khoáng chất giúp đào thải cholesterol ra khỏi cơ thể, đồng thời tăng lượng Protein thực vật vào cơ thể.



Còn các loại trái cây dù tốt vẫn có lượng đường và Calo cao, không tốt nếu dùng thay thế rau. Bạn cần phải chú ý khi sử dụng trái cây cho người trong quá trình giảm cân, hay có bệnh tiểu đường.



Bạn có thể thêm trái cây vào khẩu phần ăn, nhưng tuyệt đối không được dùng chúng thay thế rau. Bác sĩ Nguyễn Văn Tiến cho hay, một người nên ăn cả rau và trái cây với lượng trung bình là 400g/ngày.rái cây dù tốt cho sức khỏe nhưng cũng không thể thay thế rau. Mỗi loại thực phẩm sẽ có công dụng nhất định, do đó bạn nên cân nhắc đảm bảo phần rau cũng như trái cây trong mỗi bữa ăn của gia đình.



Lựa chọn trái cây chất lượng là sự lựa chọn hoàn hảo cho sức khỏe của bạn và những người thân yêu. Hãy nhanh tay liên hệ Shop qua 096.442.8039 (Zalo) để nhận được nhận tư vấn – báo giá các loại trái cây mới nhất, các mẫu giỏ trái cây hiện đại.Rau và trái cây đều cung cấp lượng dưỡng chất cần thiết cho cơ thể đặc biệt là Vitamin C, chất khoáng và vi khoáng. Ngoài ra chúng còn cung cấp lượng lớn Vitamin A và chất chống oxy hóa.



Ở rau, bạn còn có thể tìm thấy lượng lớn chất xơ, muối khoáng. Đồng thời các loại rau còn là nguồn kháng sinh thực vật giúp tăng đề kháng cho sức khỏe của bạn.



Trái cây có lượng calo lớn hơn rau, đồng thời trong các trái cây đều có một lượng đường nhất định. Các loại trái cây khi chín có màu hồng, đỏ, cam có hàm lượng Beta Caroten cao và giàu Sắt, có khả năng phòng bệnh thiếu vitamin A, chống oxy hóa và ung thư.', N'thuan java', '2022-01-09 11:26:32.000', 'https://traicayxanh.vn/wp-content/uploads/2021/12/Gia-tri-dinh-duong-cua-rau-va-trai-cay.jpg');
INSERT INTO blog VALUES ('BL0005', N'Quả camu camu là gì? Tác dụng Camu Camu Berry hữu cơ', N'Quả camu camu là một loại quả rất tốt cho sức khỏe. Bạn đã biết tới chưa?', N'Quả Camu camu hay còn được biết với tên Myrciaria dubia hoặc Camocamo, là một loại quả mọng, có vị chua, thuộc họ Đào kim nương. Quả Camu camu thường mọc ở những khu vực đầm lầy của rừng mưa nhiệt đới Amazon.



Quả Camu camu có hình tròn, vỏ màu hồng đỏ như quả anh đào.Cây Camu camu có nguồn gốc và phổ biến ở những nước Nam Mỹ. Loại cây này hiện nay chưa được trồng ở Việt Nam, quả Camu camu chủ yếu được nhập khẩu từ nước ngoài.



Một cây Camu Camu trưởng thành có thể cao khoảng 3 – 5m, quả tròn nhỏ, sáng bóng, khi chín có màu đỏ hồng như quả anh đào, vị chua đặc trưng.



Để làm bột từ quả Camu Camu, người ta sẽ sấy khô nhẹ nhàng ở nhiệt độ thấp, loại bỏ nước hoàn toàn để bảo vệ nhiều chất dinh dưỡng và giữ được hương thơm và vị chua độc đáo của nó.', N'python', '2022-01-14 11:27:45.000', 'https://traicayxanh.vn/wp-content/uploads/2021/12/Qua-Camu-camu-chua-nhieu-Vitamin-C-va-chat-dinh-duong.jpg');
INSERT INTO blog VALUES ('BL0006', N'Cách lựa măng cụt ngon không bị thối, bảo quản luôn tươi lâu', N'Bài viết này sẽ hướng dẫn mọi người cách chọn trái măng cụt chuẩn không cần chỉnh.', N'Chọn măng cụt, đừng chỉ chọn quả to, học những mẹo này, măng cụt mua về ăn vừa ngon vừa ngọt.



Điểm 1: Xem màu



Lá của măng cụt nên có màu xanh lá cây tương đối tươi, và màu của lớp biểu bì nên là màu tím hồng. Khi bạn chọn măng cụt, nếu nhìn thấy vỏ màu đen bóng tốt nhất không nên mua, bởi vì măng cụt đó đã để khô lâu và có thể là tồn kho. Giống như hình ảnh dưới. Rõ ràng là những chiếc tai đã khô héo và màu của vỏ tương đối xỉn.Điểm 2: Bóp nhẹ



Khi mua măng cụt, bạn có thể dùng tay ấn nhẹ vỏ măng cụt. Nếu nó mềm và có độ đàn hồi, có nghĩa là măng cụt tương đối tươi và hương vị sẽ ngon hơn. Măng cụt cứng và khó bop có nghĩa đã được lưu trữ thời gian dài và có thể đã được sấy khô trong không khí, nhưng quả măng cụt như vậy bên trong thường cũng không đạt. Do vậy đừng cố gắng chọn quả măng cụt như vậy.Điểm 3: Nặng



Nếu các điểm khác giống nhau, nhiều người không biết nên chọn măng cụt nào. Chúng ta có thể đặt hai quả măng cụt trong tay, cảm nhận trọng lượng và chọn quả nặng tay hơn. Bàn tay quả nào càng nặng thì nước càng dồi dào và độ tươi sẽ cao hơn. Tất nhiên, nếu trọng lượng của măng cụt nhẹ hơn, thì có nghĩa thời gian lưu trữ đã lâu và nước đã ít hơn rất nhiều.', N'javascript', '2022-01-17 11:29:10.000', 'https://traicayxanh.vn/wp-content/uploads/2020/11/cách-l?a-mang-c?t-ngon-300x199.jpg'); 
/* cart */
INSERT INTO cart VALUES ('UA0004', 'PD0002', 4);
INSERT INTO cart VALUES ('UA0003', 'PD0005', 2);
INSERT INTO cart VALUES ('UA0004', 'PD0001', 1);
/* comment_blog */
INSERT INTO comment_blog VALUES ('CB0004', 'BL0001', 'null', N'thuan', N'bài viết này rất hữu ích', '2022-01-10 11:31:05.000', 10);
INSERT INTO comment_blog VALUES ('CB0005', 'BL0001', 'CB0004', N'thị', N'đúng vậy!', '2022-01-28 11:31:47.000', 20);
INSERT INTO comment_blog VALUES ('CB0006', 'BL0004', 'null', N'nguy', N'đây đúng là bài mà tôi cần tìm', '2022-02-25 11:32:39.000', 30);
/* bill*/
INSERT INTO bill VALUES ('BI0004', 'UA0005', N't?', 'dã mua', 60000, '2022-01-09 11:35:16.000', '0373535202');
INSERT INTO bill VALUES ('BI0005', 'UA0002', N'â', 'dã mua', 70000, '2021-01-08 00:00:00.000', '0373535203');
INSERT INTO bill VALUES ('BI0006', 'UA0005', N'T', 'dã mua', 120000, '2022-01-09 00:00:00.000', '0838333822');
/* bill detail */
INSERT INTO bill_detail VALUES ('PD0004', 'BI0004', 4, 40000.0000);
INSERT INTO bill_detail VALUES ('PD0005', 'BI0004', 2, 30000.0000);
INSERT INTO bill_detail VALUES ('PD0006', 'BI0005', 6, 23000.0000);
/* comment product */
INSERT INTO comment_product VALUES ('CP0004', 'PD0007', 'null', N'thuan', 4, N'bài này rất tuyệt', '2022-01-09 11:19:04.000');
INSERT INTO comment_product VALUES ('CP0005', 'PD0007', 'CP0004', N'java', 1, N'bài này không tuyệt như nghĩ đâu', '2022-01-09 11:19:50.000');
INSERT INTO comment_product VALUES ('CP0006', 'PD0007', 'CP0004', N'hexa1', 3, N'tôi thấy bình thường ma', '2022-01-09 11:20:24.000');
/* contact */
INSERT INTO contact VALUES ('CT0004', 'thuan0373535207@gmail.com', N'thuan', '01231', N'hi, tôi muốn hỏi vài thứ, hết');
INSERT INTO contact VALUES ('CT0005', 'thuan0373535204@gmail.com', N'java', NULL, N'tôi không nhận được hàng, tôi muốn khiếu nại.s');
INSERT INTO contact VALUES ('CT0006', 'thuan0373535207@gmail.com', N'hexa1', '0373535207', N'tôi gửi lời cảm ơn tới bộ quản lý web này.');


select * from user_address;
select * from user_account;
select * from contact;
select * from product;
select * from comment_product;
select * from comment_blog;
select * from blog;
select * from cart;
select * from bill;
select * from bill_detail;
select * from blog limit 2;
update product set amount_bought=51 where id_product IN( 'PD0004','PD0005','PD0006');
/* link origin cacomment_blogn't fix, change new link temporary */
update product set img_url='https://vinmec-prod.s3.amazonaws.com/images/20211218_114300_993458_an-tao-luc-nao-tot-.max-1800x1800.jpg' where id_product="PD0002";

select * from comment_product where id_product = 'PD0007';

select * from comment_blog where father_id_blog="null" order by date_post desc;
update product set product_type="rau củ" WHERE product_type="rau củ";
update comment_blog set father_id_blog=null where father_id_blog in('NULL','null');
UPDATE `raucuqua`.`product` SET `product_type` = 'trái cây' WHERE (`id_product` = 'PD0002');
UPDATE `raucuqua`.`product` SET `product_type` = 'rau củ' WHERE (`id_product` = 'PD0001');
alter table user_address add user_name varchar(50) not null;
alter table user_address add is_choose boolean not null default false;
update user_address set user_name='khai_default_name' where id_address in('AD0001','AD0002','AD0003');
update user_address set user_name='thuan_default_name' where id_address in('AD0004','AD0005','AD0006');
update user_address set user_name='dao_default_name' where id_address in('AD0007','AD0008','AD0009');
update user_address set is_choose = true where id_address = 'AD0004';
select * from user_address where id_user='UA0003';



/* update blog*/
update blog set content='
<p>1. Tuyệt đối không rửa rau, củ, quả trước khi mang đi cất trữ.Điều đó sẽ khiến rau, củ, quả dễ bị ủng, thối. Bạn chỉ cần lau qua bằng giấy ăn hoặc khăn khô là được.</p>
<p>2. Không nên để rau, củ, quả trong môi trường ẩm ướt bởi như vậy sẽ khiến chúng nhanh hỏng.Các bạn nên đặt giấy ăn khô và những chiếc túi hay hộp bảo quản rau, củ, quả.</p>
<p>3. Tuyệt đối không cho các loại rau quả này vào tủ lạnh!Ớt chuông, dưa chuột, cà chua cần được bảo quản ở nhiệt độ phòng, nếu không chúng sẽ nhanh hỏng và dễ mất chất.</p>
<p>4. Rau, củ, quả đã cắt hoặc gọt vỏ cần cho vào hộp kín.Như vậy sẽ khiến cho thực phẩm của bạn giữ được lâu hơn và hạn chế tình trạng mất chất.</p>
<p>5. Không nên để rau, củ, quả ở nhiệt độ quá lạnh.Đừng nghĩ rằng điều đó sẽ giúp bảo quản lâu hơn, trái lại nó còn khiến thực phẩm của bạn nhanh hỏng hơn khi rã đông đó.</p>
<p>6. Một số loại rau quả không nên để cùng nhau.Chúng ta không nên để chung chuối, quả mơ, dưa hấu, lê, mận, xoài, và cà chua với một trong các loại rau quả bao gồm táo, cà tím, dưa hấu, khoai tây, bí ngô, cà rốt và bông cải xanh. Điều đó sẽ khiến rau quả của bạn nhanh bị hỏng.</p>
<p>7. Muốn bảo quản rau củ ở nhiệt độ phòng, hãy để chúng ở vị trí thông thoáng.Tránh cho vào hộp hay túi nilon ở nhiệt độ thường, như vậy thực phẩm sẽ nhanh bị ủng, thối…</p>
<p>8. Muốn giữ nho tươi lâu, hãy cho vào túi polyetylen hoặc hộp nhựa.Với nho hay cherry, bạn nên cho vào túi polyetylen hoặc hộp nhựa rồi đặt vào tủ lạnh.</p>
<p>9. Không nên cho chuối vào tủ lạnh.Thay vào đó, các bạn hãy để ở nhiệt độ phòng và bọc phần cuống lại bằng màng bọc thực phẩm.'</p>
' where id_blog ='BL0001'


update blog set content='
<p>1. Tăng cường hệ miễn dịch</p>
<p>2. Bảo vệ mắt</p>
<p>3. Phòng chống ung thư</p>
<p>4. Ngăn ngừa các nếp nhăn</p>
<p>5. Đánh bại cholesterol có hại</p>
<p>6. Hạn chế viêm nhiễm</p>
<p>7. Điều chỉnh huyết áp</p>
<p>8. Tăng cường chất xơ</p>
<p>9. Kiểm soát cân nặng</p>
<p>10. Hỗ trợ cho sức khỏe tiền sinh sản</p>
<p>11. Viên thuốc trị gút mới</p>
' where id_blog ='BL0002'


update blog set content='
<h5>1. Cơ thể yếu thảm hại</h5>
<p>Nếu không ăn rau, hẳn nhiên cơ thể ta sẽ có chút khác lạ bởi rau, củ, quả chính là nguồn bổ sung rất nhiều vitamin như vitamin A, B, C, E, K và các loại khoáng chất cho cơ thể.</p>
<p>Về cơ bản, các vitamin sẽ có tác dụng điều hòa sinh lý cơ thể (vitamin E), hỗ trợ tốt cho mắt (vitamin A), tăng tốc độ phục hồi vết thương (vitamin C), chống lão hóa (vitamin B), thậm chí là chống cả ung thư (vitamin K).</p>
<p>Do đó, thiếu hụt vitamin sẽ khiến bạn đối mặt với nhiều mối lo sức khỏe ở xương, tâm sinh lý, hay cả bệnh tim mạch.</p>
<p>Ngoài ra, các loại rau xanh hầu hết đều có chứa hàm lượng sắt cao – một trong các yếu tố tạo máu. Vì thế, thói quen không ăn rau sẽ dẫn đến nhiều bệnh lý liên quan đến thiếu máu, hạ đường huyết, khiến chúng ta choáng ngất, thậm chí là nguy hiểm đến tính mạng.</p>
<h5>2. Ăn ít đi nhưng vẫn tăng cân vù vù</h5>
<p>Tại sao lại vậy? Đó là vì rau củ quả và trái cây có chứa nhiều nước, khiến bạn có cảm giác no nhanh. Thêm vào đó, đây là các loại thực phẩm mật độ năng lượng thấp nhất, chỉ khoảng 0-1,5 calorie/gram so với các thực phẩm khác có tới 4-9 calorie/gram.</p>
<p>Việc bỏ qua một lượng lớn rau hàng ngày sẽ khiến bạn buộc phải bù đắp bằng các thực phẩm giàu năng lượng hơn. Chính vì thế, dù có thể thoạt trông bạn đang ăn ít hơn, nhưng lượng calorie nạp vào lại nhiều hơn rất nhiều lần và hệ quả là bạn… béo lên.</p>
<h5>3. Thảm họa khi… đi cầu</h5>
<p>Rau củ quả có chứa nhiều chất xơ – thành phần rất có lợi cho đường tiêu hóa.</p>
<p>Các loại thức ăn thông thường khi vào trong dạ dày sẽ bị hòa tan và thu gọn thể tích. Tuy nhiên, để thức ăn tiêu hóa di chuyển qua đường ruột nhanh và dễ dàng hơn, chúng ta cần tập hợp một lượng lớn thức ăn.</p>
<p>Đây sẽ là lúc rau củ quả phát huy tác dụng. Khác với các loại thức ăn thông thường, chất xơ không bị phân giải trong quá trình tiêu hóa.</p>
<p>Nhờ đó, thức ăn tiêu hóa sẽ có thể tích lớn hơn, góp phần kích thích “nhu động ruột” (chuyển động co bóp của ruột để đưa thức ăn đi).</p>
<p>Vì vậy nếu như loại bỏ rau ra khỏi chế độ ăn, việc “đi cầu” sẽ thực sự trở thành thảm họa đối với bạn. Ngoài ra, theo viện Y tế quốc gia Mỹ, việc táo bón lâu ngày có thể gây bệnh trĩ, hoặc viêm ruột thừa.</p>
<p>Trĩ sẽ gây nhiều bất tiện và đau đớn trong cuộc sống hàng ngày, còn viêm ruột thừa nếu không được chữa trị kịp thời có thể khiến bạn tử vong.</p>
<h5>4. Nguy cơ đau tim tăng mạnh</h5>
<p>Việc thiếu chất xơ cũng khiến bạn tăng nguy cơ bị các chứng bệnh về tim mạch.</p>
<p>Cụ thể, theo một nghiên cứu vào năm 2011 trên tạp chí Circulation về sự liên hệ giữa việc ăn ít rau và bệnh tim, kết quả cho thấy những người ăn ít rau từ bé có nguy cơ bị bệnh xơ vữa động mạch khi về già.</p>
<p>Ngoài ra, nghiên cứu còn chỉ ra rằng những người ăn nhiều rau thì tỷ lệ bệnh tim mạch và các bệnh liên quan sẽ ở mức thấp.</p>
<p>Ngược lại, những người không ăn rau và dung nạp nhiều chất béo thì có khả năng cao bị nghẽn mạch máu, dẫn đến các cơn đau tim và đột quỵ.</p>
' where id_blog ='BL0003'

delete * from blog where id_blog='BL0009'

update blog set img_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEnI0CtCpFUcuNdDlURkdS_blxyvwYrzSPoQ&usqp=CAU' where id_blog = 'BL0006';

