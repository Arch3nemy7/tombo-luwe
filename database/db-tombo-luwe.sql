toc.dat                                                                                             0000600 0004000 0002000 00000072713 14620266736 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           !                |         
   onlineshop    15.2    15.2 c    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         x           1262    52237 
   onlineshop    DATABASE     �   CREATE DATABASE onlineshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE onlineshop;
                postgres    false         �            1255    52238    after_user_info_insert()    FUNCTION       CREATE FUNCTION public.after_user_info_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO user_info_backup VALUES (NEW.user_id, NEW.first_name, NEW.last_name, NEW.email, NEW.password, NEW.mobile, NEW.address1, NEW.address2);
  RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.after_user_info_insert();
       public          postgres    false         �            1259    52239 
   admin_info    TABLE     �   CREATE TABLE public.admin_info (
    admin_id integer NOT NULL,
    admin_name character varying(100) NOT NULL,
    admin_email character varying(300) NOT NULL,
    admin_password character varying(300) NOT NULL
);
    DROP TABLE public.admin_info;
       public         heap    postgres    false         �            1259    52244    admin_info_admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_info_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.admin_info_admin_id_seq;
       public          postgres    false    214         y           0    0    admin_info_admin_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.admin_info_admin_id_seq OWNED BY public.admin_info.admin_id;
          public          postgres    false    215         �            1259    52245    brands    TABLE     ]   CREATE TABLE public.brands (
    brand_id integer NOT NULL,
    brand_title text NOT NULL
);
    DROP TABLE public.brands;
       public         heap    postgres    false         �            1259    52250    brands_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.brands_brand_id_seq;
       public          postgres    false    216         z           0    0    brands_brand_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands.brand_id;
          public          postgres    false    217         �            1259    52251    cart    TABLE     �   CREATE TABLE public.cart (
    id integer NOT NULL,
    p_id integer NOT NULL,
    ip_add character varying(250) NOT NULL,
    user_id integer,
    qty integer NOT NULL
);
    DROP TABLE public.cart;
       public         heap    postgres    false         �            1259    52254    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    218         {           0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    219         �            1259    52255 
   categories    TABLE     ]   CREATE TABLE public.categories (
    cat_id integer NOT NULL,
    cat_title text NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false         �            1259    52260    categories_cat_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.categories_cat_id_seq;
       public          postgres    false    220         |           0    0    categories_cat_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.categories_cat_id_seq OWNED BY public.categories.cat_id;
          public          postgres    false    221         �            1259    52261 
   email_info    TABLE     [   CREATE TABLE public.email_info (
    email_id integer NOT NULL,
    email text NOT NULL
);
    DROP TABLE public.email_info;
       public         heap    postgres    false         �            1259    52266    email_info_email_id_seq    SEQUENCE     �   CREATE SEQUENCE public.email_info_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.email_info_email_id_seq;
       public          postgres    false    222         }           0    0    email_info_email_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.email_info_email_id_seq OWNED BY public.email_info.email_id;
          public          postgres    false    223         �            1259    52267    logs    TABLE     �   CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(50) NOT NULL,
    date timestamp without time zone NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.logs;
       public         heap    postgres    false         �            1259    52270    logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public          postgres    false    224         ~           0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
          public          postgres    false    225         �            1259    52271    order_products    TABLE     �   CREATE TABLE public.order_products (
    order_pro_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    qty integer,
    amt integer
);
 "   DROP TABLE public.order_products;
       public         heap    postgres    false         �            1259    52274    order_products_order_pro_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_products_order_pro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.order_products_order_pro_id_seq;
       public          postgres    false    226                    0    0    order_products_order_pro_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.order_products_order_pro_id_seq OWNED BY public.order_products.order_pro_id;
          public          postgres    false    227         �            1259    52275    orders    TABLE     �   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    qty integer NOT NULL,
    trx_id character varying(255) NOT NULL,
    p_status character varying(20) NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false         �            1259    52278    orders_info    TABLE     '  CREATE TABLE public.orders_info (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    f_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    zip integer NOT NULL,
    cardname character varying(255) NOT NULL,
    cardnumber character varying(20) NOT NULL,
    expdate character varying(255) NOT NULL,
    prod_count integer,
    total_amt integer,
    cvv integer NOT NULL
);
    DROP TABLE public.orders_info;
       public         heap    postgres    false         �            1259    52283    orders_info_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_info_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.orders_info_order_id_seq;
       public          postgres    false    229         �           0    0    orders_info_order_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.orders_info_order_id_seq OWNED BY public.orders_info.order_id;
          public          postgres    false    230         �            1259    52284    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    228         �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    231         �            1259    52285    products    TABLE     D  CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_cat integer NOT NULL,
    product_brand integer NOT NULL,
    product_title character varying(255) NOT NULL,
    product_price integer NOT NULL,
    product_desc text NOT NULL,
    product_image text NOT NULL,
    product_keywords text NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false         �            1259    52290    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    232         �           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    233         �            1259    52291    user_info_user_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.user_info_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.user_info_user_id_seq;
       public          postgres    false         �            1259    52292 	   user_info    TABLE     �  CREATE TABLE public.user_info (
    user_id integer DEFAULT nextval('public.user_info_user_id_seq'::regclass) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    mobile character varying(10) NOT NULL,
    address1 character varying(300) NOT NULL,
    address2 character varying(11) NOT NULL
);
    DROP TABLE public.user_info;
       public         heap    postgres    false    234         �            1259    52298    user_info_backup    TABLE     �  CREATE TABLE public.user_info_backup (
    user_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    mobile character varying(10) NOT NULL,
    address1 character varying(300) NOT NULL,
    address2 character varying(11) NOT NULL
);
 $   DROP TABLE public.user_info_backup;
       public         heap    postgres    false         �            1259    52303    user_info_backup_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_info_backup_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.user_info_backup_user_id_seq;
       public          postgres    false    236         �           0    0    user_info_backup_user_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.user_info_backup_user_id_seq OWNED BY public.user_info_backup.user_id;
          public          postgres    false    237         �           2604    52304    admin_info admin_id    DEFAULT     z   ALTER TABLE ONLY public.admin_info ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_info_admin_id_seq'::regclass);
 B   ALTER TABLE public.admin_info ALTER COLUMN admin_id DROP DEFAULT;
       public          postgres    false    215    214         �           2604    52305    brands brand_id    DEFAULT     r   ALTER TABLE ONLY public.brands ALTER COLUMN brand_id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);
 >   ALTER TABLE public.brands ALTER COLUMN brand_id DROP DEFAULT;
       public          postgres    false    217    216         �           2604    52306    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218         �           2604    52307    categories cat_id    DEFAULT     v   ALTER TABLE ONLY public.categories ALTER COLUMN cat_id SET DEFAULT nextval('public.categories_cat_id_seq'::regclass);
 @   ALTER TABLE public.categories ALTER COLUMN cat_id DROP DEFAULT;
       public          postgres    false    221    220         �           2604    52308    email_info email_id    DEFAULT     z   ALTER TABLE ONLY public.email_info ALTER COLUMN email_id SET DEFAULT nextval('public.email_info_email_id_seq'::regclass);
 B   ALTER TABLE public.email_info ALTER COLUMN email_id DROP DEFAULT;
       public          postgres    false    223    222         �           2604    52309    logs id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224         �           2604    52310    order_products order_pro_id    DEFAULT     �   ALTER TABLE ONLY public.order_products ALTER COLUMN order_pro_id SET DEFAULT nextval('public.order_products_order_pro_id_seq'::regclass);
 J   ALTER TABLE public.order_products ALTER COLUMN order_pro_id DROP DEFAULT;
       public          postgres    false    227    226         �           2604    52311    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    231    228         �           2604    52312    orders_info order_id    DEFAULT     |   ALTER TABLE ONLY public.orders_info ALTER COLUMN order_id SET DEFAULT nextval('public.orders_info_order_id_seq'::regclass);
 C   ALTER TABLE public.orders_info ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    230    229         �           2604    52313    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    233    232         �           2604    52314    user_info_backup user_id    DEFAULT     �   ALTER TABLE ONLY public.user_info_backup ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_backup_user_id_seq'::regclass);
 G   ALTER TABLE public.user_info_backup ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    237    236         [          0    52239 
   admin_info 
   TABLE DATA           W   COPY public.admin_info (admin_id, admin_name, admin_email, admin_password) FROM stdin;
    public          postgres    false    214       3419.dat ]          0    52245    brands 
   TABLE DATA           7   COPY public.brands (brand_id, brand_title) FROM stdin;
    public          postgres    false    216       3421.dat _          0    52251    cart 
   TABLE DATA           >   COPY public.cart (id, p_id, ip_add, user_id, qty) FROM stdin;
    public          postgres    false    218       3423.dat a          0    52255 
   categories 
   TABLE DATA           7   COPY public.categories (cat_id, cat_title) FROM stdin;
    public          postgres    false    220       3425.dat c          0    52261 
   email_info 
   TABLE DATA           5   COPY public.email_info (email_id, email) FROM stdin;
    public          postgres    false    222       3427.dat e          0    52267    logs 
   TABLE DATA           9   COPY public.logs (id, action, date, user_id) FROM stdin;
    public          postgres    false    224       3429.dat g          0    52271    order_products 
   TABLE DATA           V   COPY public.order_products (order_pro_id, order_id, product_id, qty, amt) FROM stdin;
    public          postgres    false    226       3431.dat i          0    52275    orders 
   TABLE DATA           V   COPY public.orders (order_id, user_id, product_id, qty, trx_id, p_status) FROM stdin;
    public          postgres    false    228       3433.dat j          0    52278    orders_info 
   TABLE DATA           �   COPY public.orders_info (order_id, user_id, f_name, email, address, city, state, zip, cardname, cardnumber, expdate, prod_count, total_amt, cvv) FROM stdin;
    public          postgres    false    229       3434.dat m          0    52285    products 
   TABLE DATA           �   COPY public.products (product_id, product_cat, product_brand, product_title, product_price, product_desc, product_image, product_keywords) FROM stdin;
    public          postgres    false    232       3437.dat p          0    52292 	   user_info 
   TABLE DATA           p   COPY public.user_info (user_id, first_name, last_name, email, password, mobile, address1, address2) FROM stdin;
    public          postgres    false    235       3440.dat q          0    52298    user_info_backup 
   TABLE DATA           w   COPY public.user_info_backup (user_id, first_name, last_name, email, password, mobile, address1, address2) FROM stdin;
    public          postgres    false    236       3441.dat �           0    0    admin_info_admin_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.admin_info_admin_id_seq', 1, true);
          public          postgres    false    215         �           0    0    brands_brand_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.brands_brand_id_seq', 8, true);
          public          postgres    false    217         �           0    0    cart_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cart_id_seq', 74, true);
          public          postgres    false    219         �           0    0    categories_cat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.categories_cat_id_seq', 1, false);
          public          postgres    false    221         �           0    0    email_info_email_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.email_info_email_id_seq', 1, false);
          public          postgres    false    223         �           0    0    logs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.logs_id_seq', 1, false);
          public          postgres    false    225         �           0    0    order_products_order_pro_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_products_order_pro_id_seq', 1, false);
          public          postgres    false    227         �           0    0    orders_info_order_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.orders_info_order_id_seq', 1, false);
          public          postgres    false    230         �           0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);
          public          postgres    false    231         �           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 15, true);
          public          postgres    false    233         �           0    0    user_info_backup_user_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.user_info_backup_user_id_seq', 1, false);
          public          postgres    false    237         �           0    0    user_info_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.user_info_user_id_seq', 9, true);
          public          postgres    false    234         �           2606    52316    admin_info admin_info_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.admin_info
    ADD CONSTRAINT admin_info_pkey PRIMARY KEY (admin_id);
 D   ALTER TABLE ONLY public.admin_info DROP CONSTRAINT admin_info_pkey;
       public            postgres    false    214         �           2606    52318    brands brands_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (brand_id);
 <   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
       public            postgres    false    216         �           2606    52320    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    218         �           2606    52322    categories categories_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (cat_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    220         �           2606    52324    email_info email_info_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.email_info
    ADD CONSTRAINT email_info_pkey PRIMARY KEY (email_id);
 D   ALTER TABLE ONLY public.email_info DROP CONSTRAINT email_info_pkey;
       public            postgres    false    222         �           2606    52326    logs logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public            postgres    false    224         �           2606    52328 "   order_products order_products_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (order_pro_id);
 L   ALTER TABLE ONLY public.order_products DROP CONSTRAINT order_products_pkey;
       public            postgres    false    226         �           2606    52330    orders_info orders_info_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.orders_info
    ADD CONSTRAINT orders_info_pkey PRIMARY KEY (order_id);
 F   ALTER TABLE ONLY public.orders_info DROP CONSTRAINT orders_info_pkey;
       public            postgres    false    229         �           2606    52332    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    228         �           2606    52334    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    232         �           2606    52336 &   user_info_backup user_info_backup_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.user_info_backup
    ADD CONSTRAINT user_info_backup_pkey PRIMARY KEY (user_id);
 P   ALTER TABLE ONLY public.user_info_backup DROP CONSTRAINT user_info_backup_pkey;
       public            postgres    false    236         �           2606    52338    user_info user_info_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_pkey;
       public            postgres    false    235         �           1259    52339    user_info_backup_idx    INDEX     b   CREATE UNIQUE INDEX user_info_backup_idx ON public.user_info_backup USING btree (user_id, email);
 (   DROP INDEX public.user_info_backup_idx;
       public            postgres    false    236    236         �           2620    52340 (   user_info after_user_info_insert_trigger    TRIGGER     �   CREATE TRIGGER after_user_info_insert_trigger AFTER INSERT ON public.user_info FOR EACH ROW EXECUTE FUNCTION public.after_user_info_insert();
 A   DROP TRIGGER after_user_info_insert_trigger ON public.user_info;
       public          postgres    false    235    238         �           2606    52341    order_products fk_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.orders_info(order_id) ON UPDATE CASCADE;
 D   ALTER TABLE ONLY public.order_products DROP CONSTRAINT fk_order_id;
       public          postgres    false    226    3258    229         �           2606    52346    order_products fk_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 F   ALTER TABLE ONLY public.order_products DROP CONSTRAINT fk_product_id;
       public          postgres    false    232    3260    226         �           2606    60303    cart p_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT p_fkey FOREIGN KEY (p_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 5   ALTER TABLE ONLY public.cart DROP CONSTRAINT p_fkey;
       public          postgres    false    232    3260    218         �           2606    60328    products product_brand_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_brand_fkey FOREIGN KEY (product_brand) REFERENCES public.brands(brand_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.products DROP CONSTRAINT product_brand_fkey;
       public          postgres    false    232    216    3244         �           2606    60323    products product_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_category_fkey FOREIGN KEY (product_cat) REFERENCES public.categories(cat_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public.products DROP CONSTRAINT product_category_fkey;
       public          postgres    false    232    220    3248         �           2606    60318    orders product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT product_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) NOT VALID;
 =   ALTER TABLE ONLY public.orders DROP CONSTRAINT product_fkey;
       public          postgres    false    3260    228    232         �           2606    52351    orders_info user    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_info
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) NOT VALID;
 <   ALTER TABLE ONLY public.orders_info DROP CONSTRAINT "user";
       public          postgres    false    235    3262    229         �           2606    60298    cart user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT user_fkey;
       public          postgres    false    235    218    3262         �           2606    60308    orders user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT user_fkey;
       public          postgres    false    228    3262    235         �           2606    60313    logs user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT user_fkey;
       public          postgres    false    3262    224    235                                                             3419.dat                                                                                            0000600 0004000 0002000 00000000171 14620266736 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	admin	admin@gmail.com	25f9e794323b453885f5181f1b624d0b
2	admin1	admin1@gmail.com	81dc9bdb52d04dc20036dbd8313ed055
\.


                                                                                                                                                                                                                                                                                                                                                                                                       3421.dat                                                                                            0000600 0004000 0002000 00000000111 14620266736 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Champ
3	So Good
4	Sunny Gold
5	Kanzler
6	Belfoods
7	Fiesta
8	UMKM
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                       3423.dat                                                                                            0000600 0004000 0002000 00000000226 14620266736 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	26	::1	4	1
9	10	::1	7	1
10	11	::1	7	1
11	45	::1	7	1
44	5	::1	3	0
49	60	::1	8	1
50	61	::1	8	1
54	3	::1	14	1
55	5	::1	14	1
12	60		1	1
14	26		1	1
\.


                                                                                                                                                                                                                                                                                                                                                                          3425.dat                                                                                            0000600 0004000 0002000 00000000105 14620266736 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Nugget\n
2	Sosis
3	Siomay
4	Bakso
6	Kentang
7	Dimsum
5	Daging
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                           3427.dat                                                                                            0000600 0004000 0002000 00000000114 14620266736 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	admin@gmail.com
4	puneethreddy951@gmail.com
5	puneethreddy@gmail.com
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                    3429.dat                                                                                            0000600 0004000 0002000 00000000151 14620266736 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	login	2023-05-20 10:30:00	1
2	logout	2023-05-20 12:45:00	2
3	update_profile	2023-05-21 09:15:00	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                       3431.dat                                                                                            0000600 0004000 0002000 00000000005 14620266736 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3433.dat                                                                                            0000600 0004000 0002000 00000000443 14620266736 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	4	1	2	TX12345678	completed
2	7	2	1	TX98765432	pending
3	7	3	3	TX24681357	completed
4	7	4	1	TX13579246	completed
6	8	6	1	TX75102948	completed
7	8	7	2	TX93847560	pending
8	9	5	1	TX72638490	completed
9	14	4	4	TX18273645	pending
14	3	11	3	TX98765424	completed
15	8	3	3	TX82828272	pending
\.


                                                                                                                                                                                                                             3434.dat                                                                                            0000600 0004000 0002000 00000000005 14620266736 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3437.dat                                                                                            0000600 0004000 0002000 00000003471 14620266736 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        13	2	8	Nugget Ayam Juara	26999	nugget ayam	1685952801_png-transparent-hotdog-with-cabbage-ham-sausage-instant-noodle-stuffing-meat-vegetable-ham-natural-foods-leaf-vegetable-food-removebg-preview.png	nugget
14	3	8	siomay juara	24000	siomay juara	1686020834_siomay.png	siomay
15	5	7	Daging Kambing	45000	Daging Kambing merah 1kg	1686021342_kambing.jpg	daging
1	1	1	Chicken Nugget 500 gr	30000	Nugget Champ: Delicious, Hearty, 500g.	champ500.png	champ nugget 500gr
2	5	8	Daging Ayam	24000	Daging Ayam: Segar, Lezat, 500g.	dagingayam.jpg	Daging
3	1	7	Chicken Nugget Pineaple Sauce	23000	Fiesta Sambal Nanas: Eksotis, Asam, Menggoda.	fiestapin.jpg	Fiesta sambal nanas
4	1	4	Chicken Nugget	25000	Nugget SunnyGold: Delicious, Hearty, 500g.	sunnygold.jpg	sunnygold
5	2	7	Fiesta Sausage	20000	Sosis Fiesta: Gurih, Variatif, Menggugah Selera.	fiestasausage.png	sosis
6	2	5	Sosis Kanzler Premium Quality	45000	Sosis Kanzler: Lembut, Beraroma, Mengenyangkan.	kanzlersosis.png	kanzler sosis
7	2	8	Sosis UMKM	30000	Sosis UMKM: Gurih, Lezat, Kualitas Unggul, Pilihan Terbaik Konsumen, Murah Ga Murahan!	umkmsosis.jpg	sosis umkm
8	3	8	Siomay UMKM MakanBoS	15000	Kombinasi sempurna antara daging lembut dan saus gurih yang menggoda selera.	umkmsiomay.png	Siomay: Makanan Asia yang lezat dan bergizi dengan cita rasa unik.
9	3	8	Siomay UMKM TomboLuwe	10000	Makanan Asia yang lezat dan bergizi dengan cita rasa unik.	siomayumkm.png	LG OLED TV, television
10	4	6	Bakso Bellfoods	12000	Sajian tradisional yang tak tergantikan, menghadirkan perpaduan tekstur lembut dan rasa gurih yang memanjakan lidah.	bakso.png	bakso
11	4	3	Bakso So Good	14000	Makanan ikonik Indonesia yang terbuat dari daging sapi yang diolah dengan bumbu rahasia, menghadirkan sensasi gigitan yang memuaskan.	bakso2.png	bakso
12	5	8	Daging Sapi UMKM MeatGuys	45000	Daging Wuenak	meat.png	sapi
\.


                                                                                                                                                                                                       3440.dat                                                                                            0000600 0004000 0002000 00000001306 14620266736 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        25	otheruser	user	otheruser@gmail.com	puneeth@123	9535688928	Bangalore	Kumbalagodu
1	Roby 	Arjuna Wijaya	robiarjunawijaya@gmail.com	roby123	8584845412	Surabaya	Klaten
10	putut	budi	hahaha@gmail.com	123456	0856987456	sby	sby
7	Nikolas	Tesla	teslaniko@gmail.com	babi1234	0265478965	sby	sby
3	antonio	sandova	bababa@gmail.com	anjing123	0698746512	sby	bylo
8	babayo	ryan	ryanbabayo@gmail.com	burung123	089898989	sby	sby
14	Harry	Maguire	harrya@gmail.com	mu123	951588797	inggris	mancheste
2	Faris	Abdul	faris@gmail.com	hahaha	0895646878	Semarang	Surabaya
9	Roby	Wijaya	robiarjunawijaya11@gmail.com	robyarjuna17	0858484541	JL. Gebang Wetan no 42	sby
-1	nologin	nologin	nologin@nologin.com	nologin	123456789	-	-
\.


                                                                                                                                                                                                                                                                                                                          3441.dat                                                                                            0000600 0004000 0002000 00000000342 14620266736 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Faris	Abdul	faris@gmail.com	hahaha	0895646878	Semarang	Surabaya
9	Roby	Wijaya	robiarjunawijaya11@gmail.com	robyarjuna17	0858484541	JL. Gebang Wetan no 42	sby
-1	nologin	nologin	nologin@nologin.com	nologin	123456789	-	-
\.


                                                                                                                                                                                                                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000057503 14620266736 0015412 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE onlineshop;
--
-- Name: onlineshop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE onlineshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE onlineshop OWNER TO postgres;

\connect onlineshop

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: after_user_info_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.after_user_info_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO user_info_backup VALUES (NEW.user_id, NEW.first_name, NEW.last_name, NEW.email, NEW.password, NEW.mobile, NEW.address1, NEW.address2);
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.after_user_info_insert() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_info (
    admin_id integer NOT NULL,
    admin_name character varying(100) NOT NULL,
    admin_email character varying(300) NOT NULL,
    admin_password character varying(300) NOT NULL
);


ALTER TABLE public.admin_info OWNER TO postgres;

--
-- Name: admin_info_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_info_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_info_admin_id_seq OWNER TO postgres;

--
-- Name: admin_info_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_info_admin_id_seq OWNED BY public.admin_info.admin_id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    brand_id integer NOT NULL,
    brand_title text NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_brand_id_seq OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands.brand_id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    p_id integer NOT NULL,
    ip_add character varying(250) NOT NULL,
    user_id integer,
    qty integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    cat_id integer NOT NULL,
    cat_title text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_cat_id_seq OWNER TO postgres;

--
-- Name: categories_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_cat_id_seq OWNED BY public.categories.cat_id;


--
-- Name: email_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_info (
    email_id integer NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.email_info OWNER TO postgres;

--
-- Name: email_info_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_info_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_info_email_id_seq OWNER TO postgres;

--
-- Name: email_info_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_info_email_id_seq OWNED BY public.email_info.email_id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(50) NOT NULL,
    date timestamp without time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    order_pro_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    qty integer,
    amt integer
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- Name: order_products_order_pro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_order_pro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_products_order_pro_id_seq OWNER TO postgres;

--
-- Name: order_products_order_pro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_order_pro_id_seq OWNED BY public.order_products.order_pro_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    qty integer NOT NULL,
    trx_id character varying(255) NOT NULL,
    p_status character varying(20) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_info (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    f_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    zip integer NOT NULL,
    cardname character varying(255) NOT NULL,
    cardnumber character varying(20) NOT NULL,
    expdate character varying(255) NOT NULL,
    prod_count integer,
    total_amt integer,
    cvv integer NOT NULL
);


ALTER TABLE public.orders_info OWNER TO postgres;

--
-- Name: orders_info_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_info_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_info_order_id_seq OWNER TO postgres;

--
-- Name: orders_info_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_info_order_id_seq OWNED BY public.orders_info.order_id;


--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_cat integer NOT NULL,
    product_brand integer NOT NULL,
    product_title character varying(255) NOT NULL,
    product_price integer NOT NULL,
    product_desc text NOT NULL,
    product_image text NOT NULL,
    product_keywords text NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_info_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO postgres;

--
-- Name: user_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_info (
    user_id integer DEFAULT nextval('public.user_info_user_id_seq'::regclass) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    mobile character varying(10) NOT NULL,
    address1 character varying(300) NOT NULL,
    address2 character varying(11) NOT NULL
);


ALTER TABLE public.user_info OWNER TO postgres;

--
-- Name: user_info_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_info_backup (
    user_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    mobile character varying(10) NOT NULL,
    address1 character varying(300) NOT NULL,
    address2 character varying(11) NOT NULL
);


ALTER TABLE public.user_info_backup OWNER TO postgres;

--
-- Name: user_info_backup_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_info_backup_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_backup_user_id_seq OWNER TO postgres;

--
-- Name: user_info_backup_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_info_backup_user_id_seq OWNED BY public.user_info_backup.user_id;


--
-- Name: admin_info admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_info ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_info_admin_id_seq'::regclass);


--
-- Name: brands brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN brand_id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: categories cat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN cat_id SET DEFAULT nextval('public.categories_cat_id_seq'::regclass);


--
-- Name: email_info email_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_info ALTER COLUMN email_id SET DEFAULT nextval('public.email_info_email_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: order_products order_pro_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN order_pro_id SET DEFAULT nextval('public.order_products_order_pro_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_info order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_info ALTER COLUMN order_id SET DEFAULT nextval('public.orders_info_order_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: user_info_backup user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_info_backup ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_backup_user_id_seq'::regclass);


--
-- Data for Name: admin_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_info (admin_id, admin_name, admin_email, admin_password) FROM stdin;
\.
COPY public.admin_info (admin_id, admin_name, admin_email, admin_password) FROM '$$PATH$$/3419.dat';

--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (brand_id, brand_title) FROM stdin;
\.
COPY public.brands (brand_id, brand_title) FROM '$$PATH$$/3421.dat';

--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, p_id, ip_add, user_id, qty) FROM stdin;
\.
COPY public.cart (id, p_id, ip_add, user_id, qty) FROM '$$PATH$$/3423.dat';

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (cat_id, cat_title) FROM stdin;
\.
COPY public.categories (cat_id, cat_title) FROM '$$PATH$$/3425.dat';

--
-- Data for Name: email_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_info (email_id, email) FROM stdin;
\.
COPY public.email_info (email_id, email) FROM '$$PATH$$/3427.dat';

--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id, action, date, user_id) FROM stdin;
\.
COPY public.logs (id, action, date, user_id) FROM '$$PATH$$/3429.dat';

--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (order_pro_id, order_id, product_id, qty, amt) FROM stdin;
\.
COPY public.order_products (order_pro_id, order_id, product_id, qty, amt) FROM '$$PATH$$/3431.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, user_id, product_id, qty, trx_id, p_status) FROM stdin;
\.
COPY public.orders (order_id, user_id, product_id, qty, trx_id, p_status) FROM '$$PATH$$/3433.dat';

--
-- Data for Name: orders_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_info (order_id, user_id, f_name, email, address, city, state, zip, cardname, cardnumber, expdate, prod_count, total_amt, cvv) FROM stdin;
\.
COPY public.orders_info (order_id, user_id, f_name, email, address, city, state, zip, cardname, cardnumber, expdate, prod_count, total_amt, cvv) FROM '$$PATH$$/3434.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_cat, product_brand, product_title, product_price, product_desc, product_image, product_keywords) FROM stdin;
\.
COPY public.products (product_id, product_cat, product_brand, product_title, product_price, product_desc, product_image, product_keywords) FROM '$$PATH$$/3437.dat';

--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_info (user_id, first_name, last_name, email, password, mobile, address1, address2) FROM stdin;
\.
COPY public.user_info (user_id, first_name, last_name, email, password, mobile, address1, address2) FROM '$$PATH$$/3440.dat';

--
-- Data for Name: user_info_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_info_backup (user_id, first_name, last_name, email, password, mobile, address1, address2) FROM stdin;
\.
COPY public.user_info_backup (user_id, first_name, last_name, email, password, mobile, address1, address2) FROM '$$PATH$$/3441.dat';

--
-- Name: admin_info_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_info_admin_id_seq', 1, true);


--
-- Name: brands_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_brand_id_seq', 8, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 74, true);


--
-- Name: categories_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_cat_id_seq', 1, false);


--
-- Name: email_info_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_info_email_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- Name: order_products_order_pro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_order_pro_id_seq', 1, false);


--
-- Name: orders_info_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_info_order_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 15, true);


--
-- Name: user_info_backup_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_info_backup_user_id_seq', 1, false);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 9, true);


--
-- Name: admin_info admin_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_info
    ADD CONSTRAINT admin_info_pkey PRIMARY KEY (admin_id);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (brand_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (cat_id);


--
-- Name: email_info email_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_info
    ADD CONSTRAINT email_info_pkey PRIMARY KEY (email_id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (order_pro_id);


--
-- Name: orders_info orders_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_info
    ADD CONSTRAINT orders_info_pkey PRIMARY KEY (order_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: user_info_backup user_info_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_info_backup
    ADD CONSTRAINT user_info_backup_pkey PRIMARY KEY (user_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: user_info_backup_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_info_backup_idx ON public.user_info_backup USING btree (user_id, email);


--
-- Name: user_info after_user_info_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_user_info_insert_trigger AFTER INSERT ON public.user_info FOR EACH ROW EXECUTE FUNCTION public.after_user_info_insert();


--
-- Name: order_products fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.orders_info(order_id) ON UPDATE CASCADE;


--
-- Name: order_products fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: cart p_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT p_fkey FOREIGN KEY (p_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: products product_brand_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_brand_fkey FOREIGN KEY (product_brand) REFERENCES public.brands(brand_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: products product_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_category_fkey FOREIGN KEY (product_cat) REFERENCES public.categories(cat_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: orders product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT product_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) NOT VALID;


--
-- Name: orders_info user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_info
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) NOT VALID;


--
-- Name: cart user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: orders user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: logs user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             