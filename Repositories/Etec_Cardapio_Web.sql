-- Table: public.Categorias

-- DROP TABLE IF EXISTS public."Categorias";

CREATE TABLE IF NOT EXISTS public."Categorias"
(
    "Id" serial NOT NULL,
    "Nome" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Descricao" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_Categorias" PRIMARY KEY ("Id")
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Categorias"
    OWNER to postgres;

-- Table: public.Produtos

-- DROP TABLE IF EXISTS public."Produtos";

CREATE TABLE IF NOT EXISTS public."Produtos"
(
    "Id" serial NOT NULL,
    "Nome" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Descricao_Curta" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "Descricao_Detalhada" character varying(500) COLLATE pg_catalog."default" NOT NULL,
    "Preco" numeric(10,2) NOT NULL,
    "Local_Imagem" text COLLATE pg_catalog."default" NOT NULL,
    "Produto_Preferido" boolean NOT NULL,
    "Em_Estoque" boolean NOT NULL,
    "CategoriaId" integer NOT NULL,
    CONSTRAINT "PK_Produtos" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Produtos_Categorias_CategoriaId" FOREIGN KEY ("CategoriaId")
        REFERENCES public."Categorias" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Produtos"
    OWNER to postgres;

-- Index: IX_Produtos_CategoriaId

-- DROP INDEX IF EXISTS public."IX_Produtos_CategoriaId";

CREATE INDEX IF NOT EXISTS "IX_Produtos_CategoriaId"
    ON public."Produtos" ("CategoriaId" ASC NULLS LAST)
    TABLESPACE pg_default;