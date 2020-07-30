CREATE TABLE IF NOT EXISTS `stockcontrol`.`DIM_PRODUTO` (
  `ids_fornecedores` LONGTEXT NULL DEFAULT NULL,
  `id_produto` INT(11) NOT NULL AUTO_INCREMENT,
  `cod_barra` VARCHAR(25) NULL DEFAULT NULL,
  `product_name` VARCHAR(50) NULL DEFAULT NULL,
  `preco_custo` DECIMAL(19,4) NULL DEFAULT '0.0000',
  `preco_venda` DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  `quan_por_unid` VARCHAR(50) NULL DEFAULT NULL,
  `departamento` VARCHAR(50) NULL DEFAULT NULL,
  `data_cadastro` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `cod_barra` (`cod_barra` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

select * from produtos;

CREATE TABLE IF NOT EXISTS `stockcontrol`.`DIM_FORNECEDOR` (
  `id_fornecedor` INT(11) NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(50) NULL DEFAULT NULL,
  `nome_fornecedor` VARCHAR(50) NULL DEFAULT NULL,
  `rua` VARCHAR(50) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `estado` VARCHAR(25) NULL DEFAULT NULL,
  `cep` VARCHAR(25) NULL DEFAULT NULL,
  `cnpj` VARCHAR(25) NULL DEFAULT NULL,
  `datacadast` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  INDEX `razao_social` (`razao_social` ASC),
  INDEX `nome_fornecedor` (`nome_fornecedor` ASC),
  INDEX `rua` (`rua` ASC),
  INDEX `bairro` (`bairro` ASC),
  INDEX `cidade` (`cidade` ASC),
  INDEX `estado` (`estado` ASC),
  INDEX `cep` (`cep` ASC),
  INDEX `cnpj` (`cnpj` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

select * from Dim_fornecedor;


