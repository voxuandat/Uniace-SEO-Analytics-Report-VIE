--DATA TRANSFORMING:
SELECT 
		us.*,
		CASE 
				WHEN email LIKE '%edu.%' THEN 'Student'
				WHEN email LIKE '%outlook.%' THEN 'Worker'
				WHEN email = '' OR email IS NULL THEN 'Not registered'
				ELSE 'Normal'
		END AS customer_type,
		CASE 
				WHEN email = '' OR email IS NULL THEN 'Guest'
				ELSE 'Registered'
		END AS guest_registered,
		CASE 
				WHEN email LIKE '%edu.%' AND length(split_part(email, '@', 2)) < 11 THEN split_part(split_part(email, '@', 2), '.', 1)
				WHEN email LIKE '%edu.%' THEN split_part(split_part(email, '@', 2), '.', 2)
				ELSE 'other'
		END AS school,
		CASE 
				WHEN name ILIKE '%dữ liệu%' OR name ILIKE '%data%' OR name ILIKE '%excel%' OR name ILIKE '%column%' OR name ILIKE '%bảng%' OR 
						name ILIKE '%dashboard%' OR name ILIKE '%query%' OR name ILIKE '%dax%' OR name ILIKE '%chart%' THEN 'Dữ liệu' 
				WHEN name ILIKE '%lập trình%' OR name ILIKE '%bộ nhớ%' THEN 'Lập trình'
				WHEN name ILIKE '%tư duy%' OR name ILIKE '%hàm%' OR name ILIKE '%thông tin%' THEN 'Thuật toán'
				WHEN name ILIKE '%doanh số%' OR name ILIKE '%giao tiếp%' OR name ILIKE '%bán%' OR name ILIKE '%kinh doanh%' THEN 'Sales'
				WHEN name ILIKE '%quản lý%' OR name ILIKE '%mục tiêu%' OR name ILIKE '%công việc%' OR name ILIKE '%ghi nhớ%' THEN 'Quản lý'
				WHEN name ILIKE '%học%' THEN 'Môn học'
				ELSE 'Kỹ năng khác'
		END AS content_type,
		CASE  
				WHEN ma_referrer IS NULL OR ma_referrer = '' THEN 'Truy cập trực tiếp'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%google%' THEN 'Google'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%yahoo%' THEN 'Yahoo'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%facebook%' THEN 'Facebook'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%insta%' THEN 'Instagram'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%messenger%' THEN 'Messenger'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%zalo%' THEN 'Zalo'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%uniace%' THEN 'Uniace'
				WHEN split_part(ma_referrer, '/', 3) ILIKE '%form%' THEN 'Link biểu mẫu'
		      	WHEN split_part(ma_referrer, '/', 3) ILIKE '%beacon%' THEN 'Beacon'
				ELSE 'Đường dẫn khác'
		END AS web_ma_referrer,
		to_char("date", 'DY') as weekday,
		CASE 
				WHEN di.ip_address IS NULL THEN COALESCE(di.country_name, 'Not located')
				ELSE di.country_name 
		END	AS country_name,
		CASE 
				WHEN di.ip_address IS NULL THEN COALESCE(di.city_name, 'Not located')
				ELSE di.city_name 
		END	AS city_name,
		CASE 
				WHEN di.country_name = 'Vietnam' THEN 'Vietnam'
				WHEN di.country_name IS NULL THEN 'Not located'
				ELSE 'Foreign' 
		END AS vietnam_foreign
FROM uniace_seo us
LEFT JOIN data_ipaddress di ON us.ip_address = di.ip_address;


----------------------------------
--DATA INPUT TRANSFORMING:
SELECT --TOP 100
		[Email] [email],
		[Type] [type],
		[Name] [name],
		[Title] [title],
		[MA URL] [ma_url],
		[MA Referrer] [ma_referrer],
		ma_path,
		[IP Address] [ip_address],
		--cuid,
		TRY_CONVERT(datetime2, [Date], 103) [date],
		datepart(HOUR, TRY_CONVERT(datetime2, [Date], 103)) [hour],
		[Message Id] [message_id],
		[Template Id] [template_id],
		[List Id] [list_id],
		[Form Id] [form Id],
		[Campaign Id] [campaign_id],
		[Scenario Id] [scenario_id],
		[URL] url,
		[Link] link,
		[Tag] tag
FROM Uniace_1
UNION ALL
SELECT --TOP 100
		[Email] [email],
		[Type] [type],
		[Name] [name],
		[Title] [title],
		[MA URL] [ma_url],
		[MA Referrer] [ma_referrer],
		ma_path,
		[IP Address] [ip_address],
		--cuid,
		TRY_CONVERT(datetime2, [Date], 103) [date],
		datepart(HOUR, TRY_CONVERT(datetime2, [Date], 103)) [hour],
		[Message Id] [message_id],
		[Template Id] [template_id],
		[List Id] [list_id],
		[Form Id] [form Id],
		[Campaign Id] [campaign_id],
		[Scenario Id] [scenario_id],
		[URL] url,
		[Link] link,
		[Tag] tag
FROM Uniace_2
UNION ALL
SELECT --TOP 100
		[Email] [email],
		[Type] [type],
		[Name] [name],
		[Title] [title],
		[MA URL] [ma_url],
		[MA Referrer] [ma_referrer],
		ma_path,
		[IP Address] [ip_address],
		--cuid,
		TRY_CONVERT(datetime2, [Date], 103) [date],
		datepart(HOUR, TRY_CONVERT(datetime2, [Date], 103)) [hour],
		[Message Id] [message_id],
		[Template Id] [template_id],
		[List Id] [list_id],
		[Form Id] [form Id],
		[Campaign Id] [campaign_id],
		[Scenario Id] [scenario_id],
		[URL] url,
		[Link] link,
		[Tag] tag
FROM Uniace_3

