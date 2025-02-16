-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `emailVerified` DATETIME(3) NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` ENUM('admin', 'user') NOT NULL DEFAULT 'user',
    `image` VARCHAR(191) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TBL_USR_ROLES` (
    `Id_Rol` INTEGER NOT NULL AUTO_INCREMENT,
    `Rol` VARCHAR(50) NOT NULL,
    `Descripcion` VARCHAR(70) NOT NULL,

    PRIMARY KEY (`Id_Rol`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TBL_OBJETOS` (
    `Id_Objeto` INTEGER NOT NULL AUTO_INCREMENT,
    `Objeto` VARCHAR(70) NOT NULL,
    `Descripcion` VARCHAR(70) NOT NULL,
    `Tipo_Objeto` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`Id_Objeto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TBL_USUARIO` (
    `Id_Usuario` INTEGER NOT NULL AUTO_INCREMENT,
    `Usuario` VARCHAR(50) NOT NULL,
    `Nombre_Usuario` VARCHAR(70) NOT NULL,
    `Estado_Usuario` VARCHAR(70) NOT NULL,
    `Contrasenia` VARCHAR(255) NOT NULL,
    `Primer_Ingreso` INTEGER NOT NULL,
    `Correo_Electronico` VARCHAR(50) NOT NULL,
    `tbl_usr_roles_id_rol` INTEGER NOT NULL,

    PRIMARY KEY (`Id_Usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TBL_HIST_CONTRASENIA` (
    `Id_Historial_Contra` INTEGER NOT NULL AUTO_INCREMENT,
    `Contrasenia` VARCHAR(255) NULL,
    `tbl_usuario_id_usuario` INTEGER NOT NULL,

    PRIMARY KEY (`Id_Historial_Contra`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TBL_PERMISOS` (
    `Id_Permisos` INTEGER NOT NULL AUTO_INCREMENT,
    `Permiso_Insertar` VARCHAR(50) NOT NULL,
    `Permiso_Consultar` VARCHAR(50) NOT NULL,
    `Permiso_Actualizar` VARCHAR(50) NOT NULL,
    `Permiso_Eliminar` VARCHAR(50) NOT NULL,
    `Creador` VARCHAR(50) NOT NULL,
    `Modificado_Por` VARCHAR(50) NOT NULL,
    `Fecha_Creacion` DATETIME(0) NOT NULL,
    `Fecha_Modificacion` TIMESTAMP(0) NOT NULL,
    `tbl_usr_roles_id_rol` INTEGER NOT NULL,
    `tbl_objetos_id_objeto` INTEGER NOT NULL,

    PRIMARY KEY (`Id_Permisos`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `TBL_USUARIO` ADD CONSTRAINT `TBL_USUARIO_tbl_usr_roles_id_rol_fkey` FOREIGN KEY (`tbl_usr_roles_id_rol`) REFERENCES `TBL_USR_ROLES`(`Id_Rol`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TBL_HIST_CONTRASENIA` ADD CONSTRAINT `TBL_HIST_CONTRASENIA_tbl_usuario_id_usuario_fkey` FOREIGN KEY (`tbl_usuario_id_usuario`) REFERENCES `TBL_USUARIO`(`Id_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TBL_PERMISOS` ADD CONSTRAINT `TBL_PERMISOS_tbl_usr_roles_id_rol_fkey` FOREIGN KEY (`tbl_usr_roles_id_rol`) REFERENCES `TBL_USR_ROLES`(`Id_Rol`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TBL_PERMISOS` ADD CONSTRAINT `TBL_PERMISOS_tbl_objetos_id_objeto_fkey` FOREIGN KEY (`tbl_objetos_id_objeto`) REFERENCES `TBL_OBJETOS`(`Id_Objeto`) ON DELETE RESTRICT ON UPDATE CASCADE;
