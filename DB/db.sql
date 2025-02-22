PGDMP                         x            mathbox "   10.11 (Ubuntu 10.11-1.pgdg18.04+1)     12.1 (Ubuntu 12.1-1.pgdg18.04+1)      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16435    mathbox    DATABASE     y   CREATE DATABASE mathbox WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE mathbox;
                achraf    false            �            1259    24655    field    TABLE     w   CREATE TABLE public.field (
    field_id integer NOT NULL,
    field_name text NOT NULL,
    field_description text
);
    DROP TABLE public.field;
       public            achraf    false            �            1259    24653    field_id_seq    SEQUENCE     �   ALTER TABLE public.field ALTER COLUMN field_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          achraf    false    199            �            1259    24680    input    TABLE     �   CREATE TABLE public.input (
    input_id integer NOT NULL,
    tool_id integer NOT NULL,
    input_order integer DEFAULT 1 NOT NULL,
    input_type text
);
    DROP TABLE public.input;
       public            achraf    false            �            1259    24678    input_id_seq    SEQUENCE     �   ALTER TABLE public.input ALTER COLUMN input_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.input_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          achraf    false    203            �            1259    24665    tools    TABLE     x   CREATE TABLE public.tools (
    tool_id integer NOT NULL,
    tool_name text NOT NULL,
    field_id integer NOT NULL
);
    DROP TABLE public.tools;
       public            achraf    false            �            1259    24663    tools_id_seq    SEQUENCE     �   ALTER TABLE public.tools ALTER COLUMN tool_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          achraf    false    201            �            1259    24690    types    TABLE     Y   CREATE TABLE public.types (
    type_id integer NOT NULL,
    type_name text NOT NULL
);
    DROP TABLE public.types;
       public            achraf    false            �            1259    24705    types_id_seq    SEQUENCE     �   ALTER TABLE public.types ALTER COLUMN type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          achraf    false    204            �            1259    16438    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text,
    email text,
    creation_date timestamp without time zone
);
    DROP TABLE public.users;
       public            achraf    false            �            1259    16436    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          achraf    false    197            �          0    24655    field 
   TABLE DATA           H   COPY public.field (field_id, field_name, field_description) FROM stdin;
    public          achraf    false    199   �        �          0    24680    input 
   TABLE DATA           K   COPY public.input (input_id, tool_id, input_order, input_type) FROM stdin;
    public          achraf    false    203   /!       �          0    24665    tools 
   TABLE DATA           =   COPY public.tools (tool_id, tool_name, field_id) FROM stdin;
    public          achraf    false    201   d!       �          0    24690    types 
   TABLE DATA           3   COPY public.types (type_id, type_name) FROM stdin;
    public          achraf    false    204   �!       �          0    16438    users 
   TABLE DATA           M   COPY public.users (id, username, password, email, creation_date) FROM stdin;
    public          achraf    false    197   �!       �           0    0    field_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.field_id_seq', 1, true);
          public          achraf    false    198            �           0    0    input_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.input_id_seq', 3, true);
          public          achraf    false    202            �           0    0    tools_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tools_id_seq', 10, true);
          public          achraf    false    200            �           0    0    types_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.types_id_seq', 1, true);
          public          achraf    false    205            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          achraf    false    196                       2606    24704    tools UNIQUE_NAME 
   CONSTRAINT     S   ALTER TABLE ONLY public.tools
    ADD CONSTRAINT "UNIQUE_NAME" UNIQUE (tool_name);
 =   ALTER TABLE ONLY public.tools DROP CONSTRAINT "UNIQUE_NAME";
       public            achraf    false    201                       2606    24662    field field_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.field
    ADD CONSTRAINT field_pkey PRIMARY KEY (field_id);
 :   ALTER TABLE ONLY public.field DROP CONSTRAINT field_pkey;
       public            achraf    false    199            	           2606    24684    input input_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.input
    ADD CONSTRAINT input_pkey PRIMARY KEY (input_id);
 :   ALTER TABLE ONLY public.input DROP CONSTRAINT input_pkey;
       public            achraf    false    203                       2606    24672    tools tools_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (tool_id);
 :   ALTER TABLE ONLY public.tools DROP CONSTRAINT tools_pkey;
       public            achraf    false    201                       2606    24697    types types_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);
 :   ALTER TABLE ONLY public.types DROP CONSTRAINT types_pkey;
       public            achraf    false    204                       2606    16442    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            achraf    false    197                       2606    24673    tools FK_FIELD    FK CONSTRAINT     v   ALTER TABLE ONLY public.tools
    ADD CONSTRAINT "FK_FIELD" FOREIGN KEY (field_id) REFERENCES public.field(field_id);
 :   ALTER TABLE ONLY public.tools DROP CONSTRAINT "FK_FIELD";
       public          achraf    false    201    2819    199                       2606    24685    input FK_TOOL    FK CONSTRAINT     s   ALTER TABLE ONLY public.input
    ADD CONSTRAINT "FK_TOOL" FOREIGN KEY (tool_id) REFERENCES public.tools(tool_id);
 9   ALTER TABLE ONLY public.input DROP CONSTRAINT "FK_TOOL";
       public          achraf    false    2823    203    201            �   3   x�3��+�MJ-
�H�/��,��,V ���T��	�QH�L�I����� ��      �   %   x�3�4�̼����".# ��3�44@������ "��      �      x�3�LON�4�24�,I-.12c���� C��      �      x�3���+����� �8      �      x������ � �     