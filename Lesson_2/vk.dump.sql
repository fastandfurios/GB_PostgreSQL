PGDMP     !                    z            vk %   12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)    12.11 F    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32768    vk    DATABASE     l   CREATE DATABASE vk WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
    DROP DATABASE vk;
                postgres    false            �           0    0    DATABASE vk    ACL     %   GRANT ALL ON DATABASE vk TO dmitriy;
                   postgres    false    3031            �            1259    49266    communities    TABLE     �   CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);
    DROP TABLE public.communities;
       public         heap    dmitriy    false            �            1259    49264    communities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.communities_id_seq;
       public          dmitriy    false    212            �           0    0    communities_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;
          public          dmitriy    false    211            �            1259    41008    communities_users    TABLE     �   CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);
 %   DROP TABLE public.communities_users;
       public         heap    dmitriy    false            �            1259    49178 
   friendship    TABLE       CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);
    DROP TABLE public.friendship;
       public         heap    dmitriy    false            �            1259    49176    friendship_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.friendship_id_seq;
       public          dmitriy    false    208            �           0    0    friendship_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;
          public          dmitriy    false    207            �            1259    49186    friendship_statuses    TABLE     e   CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);
 '   DROP TABLE public.friendship_statuses;
       public         heap    dmitriy    false            �            1259    49184    friendship_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.friendship_statuses_id_seq;
       public          dmitriy    false    210            �           0    0    friendship_statuses_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;
          public          dmitriy    false    209            �            1259    49166    messages    TABLE     �   CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);
    DROP TABLE public.messages;
       public         heap    dmitriy    false            �            1259    49164    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          dmitriy    false    206            �           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          dmitriy    false    205            �            1259    49380    photo    TABLE       CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);
    DROP TABLE public.photo;
       public         heap    dmitriy    false            �            1259    49378    photo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.photo_id_seq;
       public          dmitriy    false    214            �           0    0    photo_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;
          public          dmitriy    false    213            �            1259    49416    subscriptions    TABLE     �   CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    on_user_id integer NOT NULL,
    on_community_id integer NOT NULL,
    is_subscribed boolean
);
 !   DROP TABLE public.subscriptions;
       public         heap    dmitriy    false            �            1259    49414    subscriptions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.subscriptions_id_seq;
       public          dmitriy    false    218            �           0    0    subscriptions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;
          public          dmitriy    false    217            �            1259    49154    users    TABLE     '  CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    dmitriy    false            �            1259    49152    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          dmitriy    false    204            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          dmitriy    false    203            �            1259    49394    video    TABLE       CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);
    DROP TABLE public.video;
       public         heap    dmitriy    false            �            1259    49392    video_id_seq    SEQUENCE     �   CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.video_id_seq;
       public          dmitriy    false    216            �           0    0    video_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;
          public          dmitriy    false    215            !           2604    49269    communities id    DEFAULT     p   ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);
 =   ALTER TABLE public.communities ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    212    211    212                       2604    49181    friendship id    DEFAULT     n   ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);
 <   ALTER TABLE public.friendship ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    207    208    208                        2604    49189    friendship_statuses id    DEFAULT     �   ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);
 E   ALTER TABLE public.friendship_statuses ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    210    209    210                       2604    49169    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    205    206    206            "           2604    49383    photo id    DEFAULT     d   ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);
 7   ALTER TABLE public.photo ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    214    213    214            $           2604    49419    subscriptions id    DEFAULT     t   ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);
 ?   ALTER TABLE public.subscriptions ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    217    218    218                       2604    49157    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    203    204    204            #           2604    49397    video id    DEFAULT     d   ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);
 7   ALTER TABLE public.video ALTER COLUMN id DROP DEFAULT;
       public          dmitriy    false    216    215    216            �          0    49266    communities 
   TABLE DATA           G   COPY public.communities (id, name, creator_id, created_at) FROM stdin;
    public          dmitriy    false    212   �M       �          0    41008    communities_users 
   TABLE DATA           N   COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
    public          dmitriy    false    202   "W       �          0    49178 
   friendship 
   TABLE DATA           {   COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
    public          dmitriy    false    208   q[       �          0    49186    friendship_statuses 
   TABLE DATA           7   COPY public.friendship_statuses (id, name) FROM stdin;
    public          dmitriy    false    210   �c       �          0    49166    messages 
   TABLE DATA           n   COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
    public          dmitriy    false    206   �c       �          0    49380    photo 
   TABLE DATA           R   COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
    public          dmitriy    false    214   qq       �          0    49416    subscriptions 
   TABLE DATA           W   COPY public.subscriptions (id, on_user_id, on_community_id, is_subscribed) FROM stdin;
    public          dmitriy    false    218   Y�       �          0    49154    users 
   TABLE DATA           c   COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
    public          dmitriy    false    204   w�       �          0    49394    video 
   TABLE DATA           R   COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
    public          dmitriy    false    216   ,�       �           0    0    communities_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.communities_id_seq', 150, true);
          public          dmitriy    false    211            �           0    0    friendship_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.friendship_id_seq', 150, true);
          public          dmitriy    false    207            �           0    0    friendship_statuses_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 5, true);
          public          dmitriy    false    209            �           0    0    messages_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.messages_id_seq', 150, true);
          public          dmitriy    false    205            �           0    0    photo_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.photo_id_seq', 150, true);
          public          dmitriy    false    213            �           0    0    subscriptions_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.subscriptions_id_seq', 150, true);
          public          dmitriy    false    217            �           0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_id_seq', 150, true);
          public          dmitriy    false    203            �           0    0    video_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.video_id_seq', 150, true);
          public          dmitriy    false    215            6           2606    49273     communities communities_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);
 J   ALTER TABLE ONLY public.communities DROP CONSTRAINT communities_name_key;
       public            dmitriy    false    212            8           2606    49271    communities communities_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.communities DROP CONSTRAINT communities_pkey;
       public            dmitriy    false    212            &           2606    41012 (   communities_users communities_users_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);
 R   ALTER TABLE ONLY public.communities_users DROP CONSTRAINT communities_users_pkey;
       public            dmitriy    false    202    202            0           2606    49183    friendship friendship_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.friendship DROP CONSTRAINT friendship_pkey;
       public            dmitriy    false    208            2           2606    49193 0   friendship_statuses friendship_statuses_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.friendship_statuses DROP CONSTRAINT friendship_statuses_name_key;
       public            dmitriy    false    210            4           2606    49191 ,   friendship_statuses friendship_statuses_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.friendship_statuses DROP CONSTRAINT friendship_statuses_pkey;
       public            dmitriy    false    210            .           2606    49174    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            dmitriy    false    206            :           2606    49388    photo photo_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.photo DROP CONSTRAINT photo_pkey;
       public            dmitriy    false    214            <           2606    49390    photo photo_url_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);
 =   ALTER TABLE ONLY public.photo DROP CONSTRAINT photo_url_key;
       public            dmitriy    false    214            B           2606    49421     subscriptions subscriptions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_pkey;
       public            dmitriy    false    218            (           2606    49161    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            dmitriy    false    204            *           2606    49163    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            dmitriy    false    204            ,           2606    49159    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            dmitriy    false    204            >           2606    49402    video video_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.video DROP CONSTRAINT video_pkey;
       public            dmitriy    false    216            @           2606    49404    video video_url_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);
 =   ALTER TABLE ONLY public.video DROP CONSTRAINT video_url_key;
       public            dmitriy    false    216            �   c	  x�uY�r�8<�_��� ��[���uD�֌d��B��D�I����Ļ����@�*+3������E�Ú=��>,C�u:�+�mXY�D.�]��*����O����>v�����K��yb�z���;Q�Œ�/ݚ�NOXR�󚻜�%;d�I]p޴�㦦7V�z)���#�.���������������6��ٷ}�K�eާ�����yG�5{�C�����tV�:d�JV�x�:�lܧNꢶ�̊:�H�e-{���ώ����}���:y���_�:��fߗ�C&�K�2䀗d9g�>{6����n0w��J�����d�`���!{�g<����"�${���,�.x/D����A��릶}X�����Q�aچU��EM�:�ӆ;_޻��I:�F��f�4��˦�̼�Ǽ�KA�k�m���埰�K��N���}ŵކ%;��o��zWk���2�����b�]5���d��ٗ�W�Zq}
�úνB�Wƅ˲>�Vg_����e��5�2�������,�)�PF������g5��wA*K��t�Sm��sz\ɾ/�2焀#=�~C���F�#�����d�HQ��|���_��ØB�j#��W�%���#��G&4̢��.��<g�A��a�6[���Y�2gݻz5!�%n�K���J�\aG@���tϚ6`Y�d��X�N��V[�M��Q�H��`wYf༉���*؏ͥ>�I�]�X�/��=��Ǻ�h�{P���봥lb	в����!)�m���3�}�ޔ�&|�I�H�������r	����Ky�@�@C��\bo�M.��@l��;���Q�y��� U�w�n��%�I  +$��wq�e�.NԦ(X�0=�b�Y\�,�S2#��^�_�\�&���$Ȟʪ:�Q��&)E�"0�nX��	��.ҳ�]��+��Su������{@B���d�]�(w��|V��w��!��� W)�i��,Pb�y�hNRYJSq]o#./� s���h��n
)���6&�.%A���o��[N�{�4,�Y-|��M��*OaM�:�Y��"� e��a/���[��9'��w�:{#D�O8��-�Ga�H�r���Mŝp���w�\��K����L�B+��	f���˼2���,��Uɂ�~�
���^U��,gP��p�0�^(�S��K�38�HC�b�m]�C?L]0�>�)�*Ē�m�uW�E�ƭ�L��{u�1
j�����V�>n&8т�L F�4����S&��.�l밌A��0���I_�V���+S݄,$�(����������.��uKZ���'�Yז�i��ГvX�}ů�_��	�i��h����j���]Uҁ�b�Ӷ�
1�2D��	>��t�
�	X�eT���JP�� ��8��h��KȘ����e�o����O/S 葻e�;\��Q�q���VX5���k�ί
e�8�1B�T1G�s4��&�;��>Յ����[=A��YQ�����e�ԞtҵwV�2@�m����qp���)����`��&H9��W��*r�h+�W�����L�R�G�&�m�Ǯ��;1��Z4���/���2�޶$�Q�֡�o�t�V�4��J\J>0s[3p�qi@D�i�?p@}��/�2q�mj��)����6��9;�	F�FD҉D�tC��`�MI�H<�z7�7��@�����
�5]Z���$�&��
�� ����yjMl6�����-|�����d[�͙6�� Y�:��CN�����vh�Rк��VRMs;\���������M�HP�\������We]��@�}:'�.�(	�@"�N,─"�s��v����O�/�q�}~(�?�U��z�ԖJz~�]n����h��yd
.=�B]���#���`Rz���5�U�#��E�y��d:زtdFx?�tԯ��ߑ����gEAO�z���0�`�d��mO�H �
�dΌ5|^�K�H*�7'����6���f�C�+J�3���R`5��m�����ɬ��$�<�w�?Q�����07�*�K
�	�0Q���& RN�6e��ZWx� �A�BW~;�B�IɅ~�F�P&%�m�N�$�4Ҥ���_�щX�1���6��W4�E �t�]j� �eI�����d<.�/���aKs+B�����r�^QZK���y�2b�(}��,(7E�L�MH<^sz$�8�Oȩ@J��}~T5�z^p7{��җn��,Sƙ ��oQ프<�wW?��Bb�����H�h�"��P�"�m�R�Ģd�#|���L�f�;�[D �G=*�D�Cg|k�)H~��s����|�L� ��$-��Lɿ�%��ܒ����^�Q[���d�Lp���O�>�j�$�      �   ?  x�mW[��
��W1�	������B�"�;�|M�$�r&��2?���������ɝr�H�H.7"�2�H���0�ߔ6���O�7�Ih?M��'�LE=�� [ⴓ��`��@���EJ��|��縤�8%.���4bn+�@�Y��I������E҇CR]��Ñ�F\'y�{:-G������e!0;}y�k�r,=�7��N��RΩ�]�RVa	YvSY�b8������ON��v��2fC=����s����b�~AGB�!�U��\�e�V`vt���E��Eg����2��%" �J#��O�x�0���j4.��Zϣ�γ��W�C�T��4"j�.@ԑY�֞C��D/w3�!��nWV�蒩���B+�c\�Mń�*?e��F��(.ǝ�O	�u�ܛ":����sL�=-��ձ4�I�BBKw�63�ŷ�Q̙�r��P�^�����Tҫ�1����ٴ���7$Y����(�鮯�"��B��w�:�����k|����V��eu�S���C��e)���T�|�%�/���Й���0�f�=�������jW]1�2��p2�9�f�EZM�uW}@�XY�M45�y���������~�Ëԉ.^�vܸb��`�Z�1��ؑi��P�vcG�� Z�-3����L�6�Ia����L���f��y�-8�r�3n�!A���#y��6� �V�|��dW�����R� �~ˡ�rԨ�

�O�2�2ٜ��� �L�K�$�v�<pj�&�K�(�vq�1p|�ûv{AY���2,}���-�׺�	D�f�G�	5aZ��h��;6ܾ�Rn��GX��2B+FX(?K�Z�khOC[�I�{I���nY*�geꗇ�J�A���w�46��sUܕ��v����=�3��k3��'�\uo�s[
i��\�Ϙ�a���BX��V�&t�*��>z�F����6>��֨ �V��'�Y��עn{T�ɖ`��ƿt�2���s����'��_��擜�C�޹M�%�}��t��ۺ_i"�2��h��(��m�e(��������=mS�?��&w�]�V��o8�#�!T������R]�L      �     x�uYm�;��>E.0���9˻�9�i�GZ%��2nEQ�j�=�0"|b�`��?����'�Ǹ>{0@sh����팩ܟ=)�Da-��~����cr����q ��8�O��J�F	���P�����Cj�\���&Fp�}Ǵ�@����?�}z :
�߇���C}�3�&�B����t"�>��J
��&��}��yL��?�0冨a��yP��x C	�O6|1����lP<������3�c�N�y�P9r�����=���`�IE}�gf������sR�܄�7�|�F�T�&�9I!�%J�#%G�XwڋϪ��������dc 
��^�F]-m�t���_�*'����DP*p���.��<�d�a�R�U�g)>XD@��>���|��*#����h�F��JTD���X,�^�U'�ė���\�'#?�q�_i���tA>)R#��o"}r�&�C�$�Q|���6DbՖ+%�'�R�fOJS�ӆ<}R<yd*�I9H�By�[m)�H�x.7����w�b�*��|�����X�+.�<t���Q
�fo���ze��6&�T�y� 8��F�sd��_�U�~�|�����w&���;9��w	�%�yu���2�iW6й�,I�+��a��!�CE��_�5o3��x�F�N�B/�GS~$�cpn�f?�q�+��.�:`ړ������BC�	����|C#CD�J�v}	�Oǣ�>�Մ�̣%^;4/��e<�J:��J�(���n����El� ���
�m��<p��U�R�t.��'�ٝ&=o�AeX<WdV,��/�ULݒ�B!8`�":Z$c�Ӣ�����t����!}�׬�z�`��S���d�Mw!c�����4�M?v�h��P�����$y �H�s_�����)�*�!r��S�J7|�"��K���M�K<�D��~�YA{h8��� ��7�Σ��6?&я�>�Q@��!��0�������i G$�o��������X
i�C�V<�
Y��3�ٔ_ˢz"e�u�(�[n�,F�7%���ΚMHw��6�N-�Jȩe�N���F�����O'�߁	.$��R񕊵́;_��FT�Ɗ:kc;CoB��$�N5G݄q2^���`����V���ĝ�=�SN�::��3d�P�J�[��Zg�d �,\c��Y��Y���~�b桇����źS�*�3@՚Q���WB��k����t�}���~C}��zʜ�V3v��HO���̓���ZŇ��,o�c���2�P�b��YM�q8�畦iVE�� O2*,�u�6U�Y=��:��%;΍&��}f�p[�)�-�"�cʞi��P�@��k���7�,�4�ԐgKk螵t[Xd%�N�Ժn���(���_�WzE*��Cۿ�gf�C�$݉{������p"_Ed��YGE���aڔ��g� ؄~T�M��i�,�.
�ӈA	�{�fğ�W�<�����өG���ꊈQڢ��#��^��;c[��>����4d��`w2{?��-�g�Dԥv����qc�M�Kﭭ��S�	+���5�}�*N%5!ዺ�=�Ec�B��
��q�>N���%�/}k��7y����x�t5���iI_��z�:A4Q 8�Ry�	�n����O��;#�\�����{.��,h�L�d�!�+y$go�V���z`N��H�˺ɬ�	�!ɂ����˺+�T��|�@SS.��7x��c��O/���|>r�u{`��z�-���2�����d���#��YK��	�
�wN�ffv��8��L$[MXb��x��l`>߫���sþD)�-o�֤�^n[)I��g�7��\�r��UKjM��Q�G�b͔o���8H��a6ޡ�����c�wL��NZZܹ�T�A�����mG(p>���J�gڼw��=/�����t���^,�9.���8^�n�㐯�=��g�J��;yh5򑝱J ���)����6��Ֆ���=����B.�=Y���1q����R ��(bBy*����������p>      �   J   x�3�tJ-.QH+�L�K)�2�tK��̩�2�t���IML/M-�2���,K-*�,��+5�N���ρ��qqq  2�      �   y  x��Zˎ#7<s��������.��/��i/�R���$ף�#�dUfOkl�tC�̌��Lʙ�4�6�ܧWog���6,���s��^���:���Y��d�K��,���%7uK���_������َ~�G�K�N���kL;`y�����qyc�¬��;��}���o�t���绹l�ݪ�8v^��3��8��b�����i��^�+��ü�Ʌ�q/.qžMe�ܸ�4oS��Ͻ�ݯX��O��h�vX��OѼ�z_^��1Ui�u��O;\Ƴ}�K?�w�O:>߽d�Gcr\�0��<�N��^��/�}�H
N����K.V#Ye��<����=�.C�-:�DWΕ��+}Z���Al���}��63�3�����~��Y )\��u<��E&;�K�������ߐ����?�Џ6%g�}vD�H�ܴ�q�!H��W:����~�O���Ǔ?���T��M���z b��8����0YF���=.�Nd�/�	r�L]�y�Y�ڊ��u~ �~��-�G��L_�����Owd�^��}:���B�l/���Gm���5E�m%P�f�z��~=-�I��(� M��f��_�6�u�KQ����>����PJ��ء5�C�:���k?˄��?\Q?��~��Hs���v�C���+߅�E���'e�A��o(��%Em�g�}"���J�m��&>��Չ�D���<R �>�H1�`qXi\�D7�VQ�y�#0�T��XW��P�����i�p��tn�ٚ��ԝ�wi�ʔ��$k ��K�D)ύ�c5bG�w ٲpk����`��% !em���x�ǵ?=�+`�6aC��R�'�@
�.�OJs��~�����i��8���t���}��!�Bl��T��UWN8r��)�e�z��ؠ�p����4��CQ�z�L��Ӈ=H��,q���� �LwE$J��(��鎻Pm��GQ�NA��&	��3 �J`L�JZ�b�h5��h�%�y���~&�U����lB4�v�n�A��&'��gl��n��WJZ$���$�6A���h���*���4o��. �BE�t�ʉ^v'��u��(���{b}YMq"��!�!�7^{0���J�����d��,���26���������@��J%$���qJg\ ����;��n��EOp�*���U59q<+��;%�:Z����%��CZ�&b;�y$���u]`�Q�NQYc� �`�g`�y ��1�Z8�1`�r�b6���S�����R�L ��ٛ� �"v��x��}@;=6A�E����`;h��6��:=<�m�J[lAǎ
i��m+y�)�Z�LW�/MZ���~I��"���:�\W��1?�S��z�l(Od�k?�#`{�l�9*�(�'�+<�� �O��Q�!#��-v��I�֫�x��tZo3�,�2�%m�S�l1$�T��q(��c���"+ơ����@E<�<-H(+�W:�F.d��MS�|�,��p�$�Ҩ��4��8jy��E&�a:Sv?�"��Zg�e#��H�C�H~��P�a*��gc���F���]�̛'&�� �U�^g���:���A��S�&��l�%��6�i]�]t����E
|	�sP��8���+�e8�IA�p�3�у���XТ$�;�Ժ).	"��:q�\��=�!�_�Hn����7��G��_�y��J�W{CVg$8��a>H�1m#����E�)��&�r?�P`W�龜R����p(��}�����k�OC(E ����ܒ�y����cE���Ә(������^{�#�bTiۚ���老�X��	دI��ܖ��H$�����9Ҝ�%�!�m�X��"���*KʈKҰi0>6��vMt�"�M�e��t򨖕�,�`�z��"p�F��aCBӼ��$�մ+R�@J�iu.j�U@Q�~�}�sUx��J��%�p���!��S	��Gx�D4�-�
w�<'��B��N|EPn��#�wX�*�P�GP1T*��+��!��RN
�^s��q@�����8E���$*&V�"r��ԘE��Fy�}֭O�6��m�,�ġ8��p�ݨ�1��l�=9rqj��RZq�W l&b�` v���܋;;*;�U���A���B5`,d� Վ��tFLX"��\��� ��_�HJ��楥�/W�4i�ЎPlsGZp؆)�<b#W���ĝ���	T�R[��-��nV�'wӣAt�%5�q�F���+�`$�B��"<L�LS�T�u?JwhV��7���J��`��kQ13�%q�v?�G�fJ����-h��F��QI�L�����I��҄�'~�dw"��*���fƀ5r�Ò��C7zOy�m�"�9qaju�4�R#��u<̇���m��Ū	�T��:|�p��?ve���L�,��z�-��X�q������PH�v� �t�B�Gc�`0�]�*�/y�N��J=�}�_�L��Y!���Q��D܅��MξiN��!#͒���U��ԑJ�Z�h�O����/��H.M��ޛ��Dh
��Wz�dRsg]V�]՟"!b,n(8�K�/�)�J�и��H��YK�B�zK�7�Ef��"�N�3l��tG��3G�?��I���.cC\�PU�DW�gPO+�؂/�%JΉ�u[�v��B"��O/3�x(�����46L�	��e�y���j�>24*}h�Uy��ɋY�&�����u^�"�ȞZ��t��a�^��5R���MsL��)���i�쒋a�e�&��&C=N�x�&��6����C��߼�Sc!aJ�2��d\ � �GVJƔcS�KoCH,�;o�jND>�A:h��L|��?�����$��h`K�ji�n	��"�r^��t���ʝd���F%j��0A��}�Ix����x�<p������]{��)_~�W�+�*�~=0#�'� �U?(��;��])���{Y������+A��hǏ�O5=�Qq�r����0&'I�6��r���L`M�����Ã�~�<�k��8��h��3�E��}��[��4|��C�"ڃ\#\HMNf��
/�˼j�Ur�$�-��o ���E���w�A�Mm��|��9GI��<�5���^h�#g�v��	
�u#7(�{4�y)�h�s�,�$�l��k IՓ+��&�#t|�͍WB��ׄ*"��ރ�J�T�����W8�2'2"���m|�݆���9CP^Y~�����l�c������5$��$�ҫ�Z8����'���05_�fO���2������W[�L�+�J�d΁�wC�Ɩ|h�$̺v��������"���Ok�y���$�?�
�C�����_�J\f��Ã��F����l1k�G���&Qe����ogO��":{�$���/_��̚>      �      x��[ێ�ȱ|&��К���/�����W�a�O~�tS#�}s�9��ޑUE�8��t y!ɻ$�2#222�7_�����_~y����v��?�Η���������9#Ec��v�������<���]n��s���_�`B|b��c���wJ����$k�l>��s��gw����i��c�'�>	�=V).ZY|�Ç{�8�L��/ó�����������s�hγ�{�[U�h#9���p��=�ޮGz��7��p��rH��Ha}����\(��
֌�Cw��o������8t_��m�/ݟn��a�o`η��浗W����:��v>���9�p��4���8^ߺ��6�{��p�k|�/������ی�R�F��x�N��h��5�yđ~��+���;����⣙o]�e�k�7��!]x!b�<��H�Cw��G��Fo�t�����/��g�z�k.��ݥ>ǩ{�St����mM.�]�r�����
��A|���:<nx���~�ݙ�y��ă�.{�`���.�@�T�q�\���SX�E�t���W�O"�	�8I�B�8N"�vo��}<��H�����@8������#��4B6�ߏc�o�j8t�u�D��2\��eM�R8�-/�][�P���<݇�i����ޮ�y��t���<�u�_S��T�Q�ږ��s�7R7��s�$pb����4_��\$��avI�$"^F��BJ(LX���ü��~����/�[2�B�|b����۟�K�v��X(^VF�&��f��eT;�"��m��|�����g���_��4u���@w�,6���y���ep͘�Qp�@��|�ؠ ��ǈ�x�t�_Y�*c[QƸDe��,���)�"�n1��/�+�Y+����I�c�a"��z����J"��I�}+�W��@�k���}~�ϡ;�#e�q����"�#���U�1�Qx<ǉ���=���70���Z�A�ML�A&�A��(C�k��A�xsNC7�oc`�~~��N�p�(tW��������m�N7���%T�Cw��?��nX!(���bQ��GJ� YՄ{Iz�����y6B"K'�P+D��x� :^���4_�J}�F�͟���p>#��unL���e�s���HV�>Ph���T��5��j����Tqn4�
�3)�.��K�W�����2�,�[��M�s�����F�Ruŧϯc&����5=�~��$� ����8`�%*��݂ ?H6�c\�#���BX���I�����:.���kEv΂и��2�C�B�ƚxsT��1��$�|��g�	5�T++Z�j���&����8\�ؓ��|?PD�b]r3�'�X+����f�����臉"��&��d�����*��z#Uئ�����g�U���$��2̵CO`��X��N!�^��}��tK�ߖV;��2ĕF+ ��ksv�@�����0H�9�ri��2��V^e��"H'�b� B��x�V9�>ɝ����
�Q� �9������O����C�@t���/Z�U��͌6��`�ƌ2�{��݂���Ъ2����A��[^C߇��i����Kʀ� '[U8�塶8�����ԋ�Pq�Q8pQ=:Z*"��D/�l��,{��t\�C�J�]�%�8�.�6��Ԭ�L޿�@��(W�[ϡ�Y��?�fj��q�Jl���iU��8��$i�:J*�O��A
$�|k�2���U�h�2=���_	�j��;*�����<-[U�#�]gj.�cG��M�Ų|�;��V���Ї��]�C2v�tv�͑.�Z1/��If��+R��.�$�em�"C̶�mgXЙ@�joĽ�g/�5���q��>)���)���u{A�3�9�&!��BZ�xq���n�䷺"ɹf8 �'�R(J��Э�@b���0h,t�����t��b�@��2�y�-=�d���2�x���K��,�V!��ZV	�k����c<�x��6�fǅ�J��2��%�n>㱱�����7��ח��s�[��J���ny^��a]����>���RHR+��@H��i�/Vӳ�� ��=��K�;�V ��׀�#Bv�z DBކ��<���1�+��޷��}k$p�Ԋ��Y2ys�C�mz$�Td�熣���*r
�L��;Fh�ZSqґ�HA�q�?���&��t���W�A���2���h5�,W�1Q��E��=�`�5e ��C������-�2d�����I#Yk*�w� N"�G�|����^x�1?+�x���Ԛs����$�aӛNRr�b���,oM�V{�C�Orɂ��`��K׉=�5�mME�;��� ̑���H2�d�V/�	!�$��]	hM�	 
>㐘����Dg��Q��vb���2	xa�����J,���2���Y+Y>+�ʲ֖�Ϲ�n��M�.��+ � �!w���V<8�h�A\�s���Ӝ��1ʹɊ|,a�kmE�;�$hrY�#`<���eF��<�y%�A8�p�A�n��~
 ����[g7�;"Q�F���0L������dሚl�_s�(�Mk+�5m=Ӎ�M�@P�]�C���Âm��:G�N5Q�P��� ��NxE��[}��o�n��,�{ݗ!˦=����-�[*%P�<K��dGƑ�F�ѯ��+�3���83����c����A��c�vľ�uehk�$OB��0�����8x����$�u��,-�T��nF7mC��l.��!*b�s�P�$�HO<�6$�2W{f��yNRN��UFh�*ii ��U�y�J����`����B�+�4À""�l��+nl�ۉZ�ed;&��R͖T�l-���/��UPΔ!sq�I��v�k�j��w�i��X7/�\�V� ���?���C|<���R�=w�]i�����p���j}�;�hf,��r�OV�c�x3���m��	_�p]�&�Q�c�����M�����/���ޒ#R+���P�{�=߽Ͼ�Y���v]	�
WV��[���3縅��"�}e�f�V�/�?��~c�8�����E��]qC��W�<h��	����,2((�|I�G�V������("Ч�q�^��$5:��Z;j{�!���+!��+��dIF$�e,ʡm�֎\����ҡ�,���"wY-�����%�6��g�X� �d��S����H!���K-�i[�}r1.Ln!K�\&H�|�j��c�߭i��,O�$�Vp$Hi-�@�]�ig;~�xKkbe�waMJ����Y~M�f��
n��i���x��L"�w(]J�)t�A��8	���Sܻ�8�Ҫ��&��Ck�Z�|�k�E>��l��+��Bskh��=���${Z�
����ǘ܇�K���$@\�=W��������4D.���+* �^��C��Sگ\6��Y)�m�$?	a��0��:��mWg+m�l]η+���WY��A�#'�g�d�7��A]�e8�1�R�;[fo�~b�+Zv���F��2x�<T�l�������f�X����B���v@Pf ݺ0��̻-���gt]e�ƁyҾxn)Ԧd9�t�����!b~- lFG'�A^ӨX��E8&4s��7�^p>O���>�"��i��8I�뢿��:p˷?�W����Y�ˤ
�°!E���ΙTܯ&啍8�H @րH��9�c�Œ8�	]�۰4��^�(�et��`���<~���]R��	1�Ͷ�H�H,��aZ+쮍��Tۆ�hC��~a��C��L�����G��,�	�`�{���Ex/DWis����e\�Kca�4DA�R6�a�M#�0[��6�цpe'N��ĩF�!9���nL}�Vw\���F���VBu{t۽�~����l�r�ɴ�+�q�ja���nt�m�~A�����jme5NzH5�4�iN�j���a��v@^ӕ���]��@�=Nb�\Ŵ��_s(��Z^Y�� vG���4�:Kbh-���y�yr��6#�e:��l�XY�p
9[ى㞶Z���h5����l�-i�R{e'N!
�WH�����X�5�]M;ԕ�8 �  Hut���K����}w��Z4^Y���h��Үz�e��ū'�[:��Z�5��|�!D�Y�[*��D�nye#΢tZ���~�2l�m�^�(�p-e(0�3ܤ3�}��R�f���"���"����uсٖ�w�p�{̡�9Z���D��]��r��~g�'�;�A���8/����o~@��m��|�A��'!?���l�wd��p��?mb'?�+�pF3�fJ7�&o�C� b�'o�S'iP�*kp�T��Tz��Ͳ��h��>J"��7�P��%W}��P�'l�+�oR)��@�OSz_�ɜ�
�U�@2��я����ܛNQ�+8��iE�M��H{����v׌������Ϝ�G0����W�������c�+j���H�*�S�)��~p'>�K��<��ax���^R������+���)�\��*FeC�+�Tx��k��]N�G��xi���ʭ(�      �     x�E�Yn$1C�Շ�-��]�;'��1|t5�%k�Hu��N���n��%;���y��3t��ݖ�v,ng���V���.S�{E�Sq���#�=�����E��u���һ7�$GS��D��Z9��˞$Z�٣H�v��׾>���ur����p9I�=�J�?�I0r�����bʐ(gT�+�qY�wL��K�e*�S�K*vVLZU��QC��N�I��6��>:m��=�,s�V��owԺ����$� ������#q0C�k�mP�΂U�2ݛ����6(D�����Re�AMߢ��_�E��mtSH)\�����v���5�k,�- �QO@��!=�ܱMA�ۄ��w��Pw���f�j=,< w��F���윢�ܜ�`U�a��E]�ݾZh��y(o�;����2`�kV �rA �]o�՝��=9���nf+�� vg�q�t����y�'���aN�V(u�`��Y��3��["�FUZ_��D���L/�J����D~�K��{��Y���:��`���c}J�
(<:�G�����d��y�z����#�'_�_�87�]Pf�5�S^GЩ.t��*�C�j�i7����Ke�D�ە�	�[��.X�~05(�/�ܛ> ���6l�5��2�4�<�4ޤ~T��@�l��ӓ�aÁ��ѵ����W�1fa���^e�T����/����Tw�v�$lSt��p�Ȣ��h� ���*	�pX#Wǜ��,eS��;�wb��K����Co���/�߻��G����������XI*�      �      x�mZ�r�H�=G}�n-������:�(iĪ�t�\��`&�H Y����$��Y�j�������܃�w]5�d?���5m3��~���j[�c�l��:�"Wz�I.���T�M�6B�H����&�[ז}s���w8�}r�cW����mW���H�)L��ZJ�dKl8��W[���JY{��v�;�{�k�C��p���dy.��l�r��jK���M�Y��֎5#|<$�4U_E����b�q�1�$Y�oH7<�J��>��԰���`��`B��v����`�:i�@�i�Ʌ�h��栉�Ы���і%�➆�a�vսk�u���/=P�1�@�����M�Ͱ�����f��롫��듶klw��B�W/�� \yƴ^�b5�����v'v���u=���x]{)�y�Bs�Ց�_~g���O}�zv��7�*]����]��jw.�)�Y.2|��s:Ud���v�*����\߳cۏ�����<�(�?Z�,��,0�ٍ�v��n�ؔ��u۹C���C����U2}���k9J?7s��k5�B'�O�Z�Q"S�?y*9U���s!��g��ИdW���{�G�0
x�6��ψonǡnۇsG���fŵb&���6"L*|���k�ʱ7��J�I�n��O;��ݶ���H�P-Jlt�4+����k�?#��>����ɽ���ǮEu���r-^����Vc\�K����y��,�=�fK�B�۶��uI9���)�"��f)��k��l1-62�lþ�v�nF_�S����*궗*��P��M>�i���������Ovhk|/�{��"M��\1���*�V���`국���cU���(��j��w9:��&0�B��m�Dy�����r{t�滱F���m\�:O79QS�	3'�b��j��]���!��!N��C))����a��ǩ=T͎��WC�/[t_�?:�f$�r"*y�p ��;�!%=��`����_*�_�(�ɹ��tv�|*�����k[�O�;:q놱K�����f�6���C�u4q<�7�Ъf�P�'�f,雑��v��7}�KC���#�r���!b�2�uۣ�Q�z��1u���.nM�S��"��(.�eT�a:pk�ȏ�~��C�X[��̽j@f�>�D'&[���s3�=���ޖ�{�;�bU�$�Z�d�閮� !�yUc�^�O4x�c�?գ�T|c ���ägL�TȒ�"e�V��0�Z�(9�r�,oJ�lc�TH�V�b�v����H�`.'޿�1|�IN@�����f��)�mu@��U��f��%w���x���N�L5H�y� �h�z8��5�G�d�����n���.A�	�1����K{DO��4mGu����O�BcL���O�0:��oA���@�Z�n$s����O(�do��HmwW=.�
DC�� �,�V���AGߺ�T�4�p��/����f�8EyfTE(�"[z'
�a�9�T�m��1*��̫Ǖ��ݎ��R�MFmd��p��=νn����f��L]�ԁe/sb%��hC��2��Do��;?l�Al�y@tQUg��R�b��g�z�z��s�����-yӎ; �2T��~,a����nB��^C��8a���9V�S��^&�� ��w�/I�)"pC����lkg�����
������6yZФ�<r����#���T6 Y���T�w,!��~xƌ<����q[�={��@E� �&Ø���%�tx8PP=������u�G!S�?�1H�� �Y������38��&����J_�yA�&%�W��	9����������R�Әz�;ʸPj�1�Q�|)�Pl����!��T�$��g�sN��pjM�^/�F�\x�H��v�"�f����<,�+���\
��L��A�N��7}��ݏ�sWx���(QD@��M4��>U��Pu~�&b�<l��q�FS��b6�g������N��{����m��c(��0	L�z /V�ԟ��O�̚���`�ۉ�Ć�F'�O�& � 	-@Oנ/�O�V�:�>&&���]�
�$E*�E�ڒQ���'sR%q�rC"s4'2�堘5ѭC	��e7��u����C��Hڗ�3���b����Df�[|r�Q&<e���pb3����p]��h[[;�	[�{��x��)%=�`N*.�p��94hfb�C�w/1�����D,h<�g}]DT&K��=X
,�v�"){��á-�`�����t�&�f�X$���=�M�wO��U�F==�U�%%lF�e�@�A�e���-�c�B"�#``$�D|�j)�?�����8�<��6���%}C��#�&)B�1'v.�UE����(??{hc7�h�\`��)&id0�e�|_H}2M���`�w�<���� b��5�b,��G�����O���$���"���`:0]��AA:&�{���S�8�n�V5ɡ
�ԥ��MNq��lP3�*5�g&	8j,���j�%d.�E�}:�k��0�t�k����X���ɫ`5��C��N��Cě�z��H�O'�i'��� �x�<���b��p����d'h��'�8��w㮲�gܓc$�LFCOn
AҥXf^�F����	�����xp����L��n3���K���c�|�hHPȽ�{/�'Ti���%�(qVI���1����P�wTVW�D�0�:7tvѡU�23u�4�\�-�Ny�����K�i�ڲ:V��jvK����G�����C����+��Ҳ��ru��K�x���+@�=�?W������9���#-�6mtJpZyF��� �Lm���j`}�[ہ�@�X[Vm��nqѯ1h��������RI�?U�C�ҭGו\��� ���o ���j5O�i�q63o��	��=g�R=���9�u�󄥽�_��{��'�K���@Ʈ	�������PC�;��`#9F� 8 t1L��ѕK��&���� J	]V}��͙/�>��-�"<��$϶�h�/�Q�p�Ԁ ��If������K��������	�#��U����)7#��D�H��V(�@����;�nAF?}��<i�?B���h�E�!0���*9��aWͿ�B�{[v�yK��*�ł� Ʉ�%��3Cˢ�"�hG	��o��K7��IgtJ�OdJ,)	�X�7$����(���&n�����q�hU��ͣAP�����0��P���-��jmj�B�Ő[%��Wbӂ.�Ed�;َ}����ڄ
I�wo��~�t�x!�
�v��AF��BL�����p�3���xV�(hЃ�r$)CI>�@L-�ԴO�%-C8HH�X}�)�����|j:ۀ#�hjI^Pk˩y*~y��&DQ7@��E�v�.�֤hH�C���a�ȅi��� �G ���A�	��yFKPrhhɊ��C�)��;�W+%���xCn�Z��}g�A�Ӟ �+�чߋ��P|R��h;wr_(�
_,��Z���z��̰�M�$����$.��)��	`�O,=k��0"���x�B����ш3<���M����\���
�aټDx���4[�/�+��;X�? fh �I<�ݢ��l�bdi��c������d��S��������Z�CT$��oq�=�z����5�+�p*HA�b�� ���;��c�IJ�i{Y�h.�/���p_ӌ��m�nXn�ϷJ�ќP���6@���3q�(���J*���nڶ�5j�H�*&D�1�2Zg�k�ľ���B���7�{:�$,�˕JF��#����p�<j��}�]=�W�y�]E����Kk���[¬���A9[8y:�r��E1�w-�9c�"�2��M)�,*hN��l����V�gk�yQLz��ܩ.M���t��g�01��_�|��P��槣���0���z2bP���s���s��N����+��b��9�)�[F4`�<�Ȫ�Xp���*��m�����"�3T[�L|��� �  vKU���������LuC�䆊߀�h����4��ZB	��jK����p��N��L�����B�g�h�=��~O1D�:�����9i+Mi��B!&��C�9�*o��L,�"{�`SDbAƸI�M>�T�j�l��w�q{Od�.l&t}�Ziڼ#�Z�ȳp�O�T:Ğ�{~d�T͹�|8-y4�2 �	v��L���ھ��n���/r���:6�w��!���Bm�k��B�cw�.�(�۫J�㩚/���*]�K]�ۇ|���{K�9_�����Т#��2,K7�R��s�|��lO辶Sʹ����H�ف�°Y�7y�O�� -��wh�����O�_�i3:���
�U�:���I�9c�]C�k���a���&�����`T'�y9zIIPS�������*̛�={y�״5����X���	��2-��劻�|�J��tA_��aKRe�m��>�n� �B���4�_YM������k^:�G��k}Rs̓>3q�б��k�$�G���Loo�aBό
x(T�xI����힦�I?��%�BH�'��3�	��p���f�%�����<�C˳�����4�C����جbo���r닣�r�q��〆�Z���Z�
�$O���'��L ���7�����g���л�ec-�]5�ג�O������k�iN#�6��@�urF�{�U����>Y���O�Ӎ��v�2'Ɲ��R��mA(��a����=C�WM��`N�r/�´B���+��DT��Hg��f����Tz�+h���wa�Z�|w���~z�CBh��kg���"����$�AeV/Cn�x�Vt��2���
�4��!�\]��_\��V��#]�����N�����d��$b�M#'�H%!�h�u�(u��_"EL񥡬`F��'�:� ��Su��p��r��>��@For�%�\�D����ݹ�]�>��g���9g��~�<5���G��.W�Hj�<����$�SU�+�����\C���1s�I����pv�GD �[�Lz�־�V/2(�\f��lWQ)����}j��^p�����sH�
M�4x����H����uݴ��K:e괜.Y�T����w�蟉�lt�j$�ܴ�2�A��M�Q{��,�����~���[��v      �      x��[ٮǑ}������U�_��2�i^��E�fzS-��}"����J#�D]egG�Yb���M�s��O?�����q�齿t��PN	+����M�c��C�\��4������h���ϨOR|���O�W�����C�Z�JU�6��yv���eh���O8����[>V�O���ij��X�\�O����v��wM?5Sw{��|j����ڮ�z�x?�]����s�D��v��ގͭo�tW�{{��x��_�/��_��>B����#��-s�`�
��U{����� ܸ���7������Ӛnh��nu�׶v�JGᖺ���4�7l��ԝ��=�t�;/�
{|E%j����W�ǌo��"����2�ޚ���s3>p�s?͗�N� q�'U|�e��|�	!⻙����1t8�?�l�]�Re����/�w��k�Ȥ��:\�j�H�����<>���Ǯ��g�iX�E��j)��[�~F����|�?����P�o����|�~s��q�|џdq}�m-%s���G����w���:��/-^����'L-�cX��%ͨ�������!�*�{���Է��-M��"Ԓ��4^D_yY��i����<�܁O����ڷ��3(���[;�Y"���;_K��j-�˭�����qGv6��z\��N ����!4F��Z�������E�Lͭ��~M��k7-Q��TukL-�z�\��=##N�}��mIsi���I�Q7jkɠ5 MVN�]�P��ҋ6�g��]wbEL�F�3 �QJD
WA:�xn��_ �;���\a��U���U���	�͈`���8O��n�r\��K�Z1�t�!+$c
r�8!���L��y,t%p�X+�1(*+*����㩁$eNܹ���V(���
L�3�8�t�vz@)�s��D�%d���B׊e�{UQ=.��L4$G;�����`'w�:n��PS(�3`�zo��
�C�������
�/1n�Ԣ�?�M1��g+s���P�N�Ѕȴ(KgQ+��G!B���yƗ�"ͯx߁�6<��e�,�hĈA��HR��ݰ��ͽ��m�)Ұ�)gC�D���{H�2�{k��������YK���[Е2Hs�@�ЪҦ���i��Ƃ�����.�V�c�.>���&Dcf�[n�F��Pk�Jkk+�����o2MA0[ J�.֚��QYX d�yY��iO�}(�
ˣDj/��y�8m�׿�����(!�MO;U��*��5I)��� �?ph ���qy��8������ZsF�"9}J.ޚ���ے0����_%S��k�@�hm�$D�4��6̌���[�$˻2�d�bD38�AZĄL��t�����H���	�������5�_�BR�U�B����=pNR�4} �Qf �,��Z�R7$-�rY\Z~�"M���pTJ{�$Y�XC��}�oc{�K�������ET*.J�b.#a�~�j�7p��j�`� 2�,�&k�	5?�6��c��/J#���kՆå�{E�����@����$���Wiʼ���0那w�L&�ޞ3�ڧ����v�W2Q�R����T�>�%�ړ{����F�GGP�a�H@4��>K��P x�SQ�.���ӡL O�`)���|'��M~j#@KDUf8� �ȚL:��Glo��k����I��ӣ c��"�4��Pe�Z��֟�tZ���ݱ��*��-K�p{S��tCFe�d���0�}�0v���C�aD��)W+\z�\�����yw9�W8����V��&t�>`��Z�d�J.p����JvU���(=0���;�����Q�M���5[��Bl���:>�D�;�����)�'���>�ڔ�/j� �H��ԍ�}�w{B�{��^(�n ʸh|+�N�\՜�{5���6"��8<Q[��B�v�A�Q�/������i��100S�����H"CY-eA�Gѡ�z�Z�:b{�}h��
�O��BXn�8�����1Ѯ���e-��]yJ�
J֎C�tT�����*�� �{�c
OplT��Wܿi�5J'�h�v>w�v;��'�.�5c���ă�����e��?�x��y��h��Ҡ��٠�?�-�h���٬�U�7I�ُWʕS��H�-;��ޥ\8ck��QkT�.�V�C�ezI�@��P��L�����v��?H��vHc�;I49�ԕ�`Z ����7J��d׎SPk#B��������^O�x{�O�.���͗�S��Rhs��\�hs�@�c����݇JAߵg@�d�����^x¾,BN�L�0�ԇȁ�nJ3�_���2�A����8h첪=��Q>H_�?�;]y��q�GG?��s �(5t��'zj�E�ɑ�'~W)k��2�����Xs�m�����D<8kk�E�*8���i�������\�a�	S�ƒ����>�gT�C�1�X��?Ԟ�'��%�?/��^}�,�n��~��˽ֵg ������r�7�Y�-������z�������vqo���v���~��"��-p(Ks�_�9���ky%�m����A)��䦆��qk�>�1��N���ԁs�(�#5~���p�o���o:��@ӓb<ut�(7��U��G�i������4b(4=E�\��Y	��#�=[��,��7����&Hz���tzɽ��Y>����p?������7c#*D�l����C!:�n�ק���g?���M|W`�r���A�/T��K�7.ې�7��:0 �N8�A�0жSb�4��}K;�����I� ׁ�D#�����	[���E�t��3r]!�#��;��r> �_9��{ʸC��:r�V��s�w�|�o9� k����k���ȍ5�0����/�U�<j��P�\�>E=7ʨ/H5E��� ��udWlLU�G*R���LF��y������(�D��\	�
��fSC�l)r���W�8�ud@�zR����H��qޛ�e{V_G��J �F�K_��Kw���ا�w)+��� svV ���u;y�d�M#���K�bB�5g�6(XB�Skͳ��S���ݳ��BS���	�oW=�b��ݬ����)\7�8er�P��r�blW��Z�Ii��nt�/�'׶b�r���%�����7�p����3$�_�)2���Ù��'R0�D�XR�����:O�v�Z���>��.�e���W.oD�1UѲ7���-;�0~5�_��A�L�E����;��7�w?J�)@܆��X<�n�	������C�P�isr����s�i�R��ihYCے&�B����x�]J�h��DY���N��[�h������/�� c��!��qj^,��EsGX▁uX�c�;%�=e[��� A����fp*U����I�h�e�uT�� ����Ӫ�^&f5�����筿�j��%��0aH���R�kݥ.��"ܔ���16JZ{��S���D��Q{H�@���փ����7X��(k6a�lZp:�?D-��_�l]�h�b�l�8�k� ��b?c��S�������m1*M&m�	n�o�"��ݸ~�z٪U��V���4��j#�.^nm�� �z ��
�27�j��AV�K� ([8�����$"��u �U�*��eݐ=ѽ@N8d7��N�6��'�4f��m]dݭ�.ʟ]���p\��J��@���^s<��L�%��U�W$"�Hʒp]A�%5�D�oqX�҂b��4	�Z���d/@X9%���</yu�䶁�w
6���?Z,n@�`a<s�>_���N�i��V4w�ܖ* ��_i��8��F%X����c�Y8.�Yr�B(�hs��qa�ya���(E�!���!c�2y����P������ݖ�����nq}nk�x�h�8P|����=%iLr�C�G����K�u���Un��`
!�����D���>�= @���m"�`��ݪT�����ßڻ�[!����\K.-�eǧ��U~�?=+7 U�*��M{���+3i��[-\������AY���AX�L�,v_��u��㶳�n�+� h  �_�u�x$Zs��m"������<1-�E;��� �d��-���ϡ���� �����t▌<���+��B�i�m���T���~w~��U�6���5Z��qU���[�䰔,
n�HჩO�S�Հ��YW�����ᶋ�� m��elR�S��ҟ_Y�^�2exKn�)i�D!V��;��V��I?mpR���t87*���-#�<H;�TdMߖ;�;MI�8�����岩͓@yZ�qz��^Q��m?������˫��}-�@*TEr�EV��	ZP|1#jpW�:L-s��?�$(�94�'����>t�/���c�/���+
�Xk���-k�k�n0m�wXnv���������v�     