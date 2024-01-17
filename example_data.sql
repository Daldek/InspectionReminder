INSERT INTO public.equipment_type(equipment_type_id, equipment_type, name) VALUES(1, 'karabinek', 'grot');
INSERT INTO public.equipment_type(equipment_type_id, equipment_type, name) VALUES(2, 'karabin wyborowy', 'grot 762N');
INSERT INTO public.equipment_type(equipment_type_id, equipment_type, name) VALUES(3, 'pistolet', 'vis 100');
INSERT INTO public.equipment_type(equipment_type_id, equipment_type, name) VALUES(4, 'karabin wyborowy', 'bor');

INSERT INTO public.equipment(equipment_id, equipment_type_id) VALUES('AA00001', 1);
INSERT INTO public.equipment(equipment_id, equipment_type_id) VALUES('AA00002', 1);
INSERT INTO public.equipment(equipment_id, equipment_type_id) VALUES('BA00001', 2);
INSERT INTO public.equipment(equipment_id, equipment_type_id) VALUES('PW00001', 3);
INSERT INTO public.equipment(equipment_id, equipment_type_id) VALUES('XX00001', 4);

INSERT INTO public.inspection_lvl_1(equipment_id, inspection_date, expiry_date) VALUES('AA00001', '2023-10-31', '2024-01-31');
INSERT INTO public.inspection_lvl_1(equipment_id, inspection_date, expiry_date) VALUES('AA00002', '2023-12-31', '2024-03-31');
INSERT INTO public.inspection_lvl_1(equipment_id, inspection_date, expiry_date) VALUES('BA00001', '2023-11-30', '2024-02-29');
INSERT INTO public.inspection_lvl_1(equipment_id, inspection_date, expiry_date) VALUES('PW00001', '2023-10-20', '2024-03-20');
INSERT INTO public.inspection_lvl_1(equipment_id, inspection_date, expiry_date) VALUES('XX00001', '2023-07-31', '2023-10-31');
INSERT INTO public.inspection_lvl_1(equipment_id, inspection_date, expiry_date) VALUES('XX00001', '2023-10-31', '2024-01-31');

INSERT INTO public.inspection_lvl_2(equipment_id, inspection_date, expiry_date) VALUES('AA00001', '2023-10-31', '2024-04-30');
INSERT INTO public.inspection_lvl_2(equipment_id, inspection_date, expiry_date) VALUES('AA00002', '2023-12-31', '2024-06-30');
INSERT INTO public.inspection_lvl_2(equipment_id, inspection_date, expiry_date) VALUES('BA00001', '2023-11-30', '2024-05-30');
INSERT INTO public.inspection_lvl_2(equipment_id, inspection_date, expiry_date) VALUES('PW00001', '2023-10-20', '2024-06-20');
INSERT INTO public.inspection_lvl_2(equipment_id, inspection_date, expiry_date) VALUES('XX00001', '2023-07-31', '2024-01-31');
