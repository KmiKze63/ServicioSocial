-- MySQL dump 10.13  Distrib 9.4.0, for Win64 (x86_64)
--
-- Host: 100.88.24.92    Database: agremiados
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.11-MariaDB-0+deb12u1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'agremiados'
--
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` FUNCTION `fn_dias_adicionales_vacaciones`(tipo_jornada VARCHAR(50),
    anios_antiguedad INT
) RETURNS int(11)
    DETERMINISTIC
BEGIN
    IF tipo_jornada = 'Tiempo Completo' THEN
        RETURN FLOOR(anios_antiguedad / 5);
    ELSEIF tipo_jornada = 'Medio Tiempo' THEN
        RETURN FLOOR(anios_antiguedad / 10);
    ELSE
        RETURN 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` FUNCTION `fn_dias_base_vacaciones`(tipo_jornada VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
    RETURN CASE 
        WHEN tipo_jornada IN ('Tiempo Completo', 'Medio Tiempo') THEN 20
        ELSE 0
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` FUNCTION `fn_es_admin_activo`(p_id_usuario INT) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
    DECLARE v_es_admin TINYINT DEFAULT 0;

    SELECT 1
    INTO v_es_admin
    FROM tb_usuario u
    INNER JOIN tb_rol r ON r.id_rol = u.id_rol
    WHERE u.id_usuario = p_id_usuario
      AND r.nombre = 'Admin'
      AND r.estado = 'Activo'
      AND u.estado = 'Activo'
    LIMIT 1;
    RETURN IFNULL(v_es_admin, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` FUNCTION `fn_puede_permiso_economico`(fecha DATE) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
    RETURN fecha BETWEEN '2025-02-16' AND '2026-02-15'; -- 👈 Ajustar según las fechas vigentes(posible cambio anual y posible parametrización futura y posible bug)
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_actualizar_facultad`(
    IN p_id_admin INT,
    IN p_id_facultad INT,
    IN p_nombre VARCHAR(150),
    IN p_direccion VARCHAR(200),
    IN p_email VARCHAR(200),
    IN p_telefono VARCHAR(20),
    IN p_estado ENUM('Activa','Inactiva')
)
BEGIN
    DECLARE v_nombre_actual VARCHAR(150);

    /* Manejo de errores */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    /* 1. Validar que quien ejecuta sea Admin activo */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos';
    END IF;

    /* 2. Verificar que la facultad exista */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_facultad
        WHERE id_facultad = p_id_facultad
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la facultad no existe';
    END IF;

    /* 3. Validar nombre único si se proporciona uno nuevo */
    IF p_nombre IS NOT NULL THEN

        SELECT nombre
        INTO v_nombre_actual
        FROM tb_facultad
        WHERE id_facultad = p_id_facultad;

        IF p_nombre <> v_nombre_actual AND EXISTS (
            SELECT 1
            FROM tb_facultad
            WHERE nombre = p_nombre
              AND id_facultad <> p_id_facultad
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: ya existe otra facultad con ese nombre';
        END IF;
    END IF;

    /* 4. Actualización parcial controlada */
    UPDATE tb_facultad
    SET
        nombre    = IF(p_nombre IS NOT NULL, p_nombre, nombre),
        direccion = IF(p_direccion IS NOT NULL, p_direccion, direccion),
        email     = IF(p_email IS NOT NULL, p_email, email),
        telefono  = IF(p_telefono IS NOT NULL, p_telefono, telefono),
        estado    = IF(p_estado IS NOT NULL, p_estado, estado)
    WHERE id_facultad = p_id_facultad;

    /* 5. Registrar auditoría */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'ACTUALIZAR_FACULTAD',
        'tb_facultad',
        p_id_facultad,
        CONCAT(
            'Actualización de facultad ID ',
            p_id_facultad
        )
    );

    COMMIT;

    /* 6. Confirmación para el backend */
    SELECT
        f.id_facultad,
        f.nombre,
        f.estado
    FROM tb_facultad f
    WHERE f.id_facultad = p_id_facultad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_actualizar_periodo`(
    IN p_id_admin INT,
    IN p_id_periodo INT,
    IN p_tipo_periodo ENUM('Vacacional','Receso'),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_dias_maximos INT,
    IN p_tipo_personal ENUM('Todos','TC_MT','H-S-M'),
    IN p_id_facultad_fk INT,
    IN p_estado ENUM('Proximo','Activo','Cerrado')
)
BEGIN
    DECLARE v_anio INT;
    DECLARE v_tipo_periodo ENUM('Vacacional','Receso');
    DECLARE v_tipo_personal ENUM('Todos','TC_MT','H-S-M');
    DECLARE v_id_facultad INT;
    DECLARE v_estado_actual ENUM('Proximo','Activo','Cerrado');

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
     resignal;
    END;
    START TRANSACTION;
    /* 1. Validar Admin (FUNCIÓN OBLIGATORIA) */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos';
    END IF;

    /* 2. Validar que el periodo exista */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_periodo_vacacional
        WHERE id_periodo = p_id_periodo
    ) THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El periodo no existe';
    END IF;

    /* 3. Obtener valores actuales */
    SELECT
        anio,
        tipo_periodo,
        tipo_personal,
        id_facultad_fk,
        estado
    INTO
        v_anio,
        v_tipo_periodo,
        v_tipo_personal,
        v_id_facultad,
        v_estado_actual
    FROM tb_periodo_vacacional
    WHERE id_periodo = p_id_periodo;

    /* 4. Validar fechas */
    IF p_fecha_inicio IS NOT NULL
       AND p_fecha_fin IS NOT NULL
       AND p_fecha_inicio >= p_fecha_fin THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de inicio debe ser menor a la fecha de fin';
    END IF;
    /* 5. Validar facultad si se proporciona */
    IF p_id_facultad_fk IS NOT NULL THEN
        IF NOT EXISTS (
            SELECT 1
            FROM tb_facultad
            WHERE id_facultad = p_id_facultad_fk
              AND estado = 'Activo'
        ) THEN
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad no existe o está inactiva';
        END IF;
    END IF;
    /* 6. Validar solapamiento */
    IF EXISTS (
        SELECT 1
        FROM tb_periodo_vacacional p
        WHERE p.id_periodo <> p_id_periodo
          AND p.anio = v_anio
          AND p.tipo_periodo = IFNULL(p_tipo_periodo, v_tipo_periodo)
          AND p.tipo_personal = IFNULL(p_tipo_personal, v_tipo_personal)
          AND (
                (p_id_facultad_fk IS NULL AND p.id_facultad_fk IS NULL)
             OR (p_id_facultad_fk IS NOT NULL AND p.id_facultad_fk = p_id_facultad_fk)
          )
          AND (
                IFNULL(p_fecha_inicio, p.fecha_inicio_periodo) <= p.fecha_fin_periodo
            AND IFNULL(p_fecha_fin, p.fecha_fin_periodo) >= p.fecha_inicio_periodo
          )
    ) THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Existe solapamiento con otro periodo';
    END IF;
    /* 7. Actualizar periodo */
    UPDATE tb_periodo_vacacional
    SET
        tipo_periodo = IF(p_tipo_periodo IS NOT NULL, p_tipo_periodo, tipo_periodo),
        fecha_inicio_periodo = IF(p_fecha_inicio IS NOT NULL, p_fecha_inicio, fecha_inicio_periodo),
        fecha_fin_periodo = IF(p_fecha_fin IS NOT NULL, p_fecha_fin, fecha_fin_periodo),
        dias_maximos = IF(p_dias_maximos IS NOT NULL, p_dias_maximos, dias_maximos),
        tipo_personal = IF(p_tipo_personal IS NOT NULL, p_tipo_personal, tipo_personal),
        id_facultad_fk = IF(p_id_facultad_fk IS NOT NULL, p_id_facultad_fk, id_facultad_fk),
        estado = IF(p_estado IS NOT NULL, p_estado, estado),
        fecha_actualizacion = CURRENT_TIMESTAMP
    WHERE id_periodo = p_id_periodo;

    /* 8. Auditoría (PROCEDIMIENTO OBLIGATORIO) */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'UPDATE',
        'tb_periodo_vacacional',
        p_id_periodo,
        CONCAT(
            'Actualización de periodo. ',
            'Tipo: ', IFNULL(p_tipo_periodo, v_tipo_periodo),
            ', Estado: ', IFNULL(p_estado, v_estado_actual)
        )
    );
    COMMIT;
    /* 9. Respuesta al backend */
    SELECT
        p_id_periodo AS id_periodo,
        IFNULL(p_tipo_periodo, v_tipo_periodo) AS tipo_periodo,
        IFNULL(p_estado, v_estado_actual) AS estado,
        CONCAT(
            IFNULL(p_fecha_inicio, ''),
            ' / ',
            IFNULL(p_fecha_fin, '')
        ) AS rango_fechas,
        IF(p_id_facultad_fk IS NULL, 'General', 'Facultad') AS alcance;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_actualizar_regla`(
    IN p_id_usuario_admin INT,
    IN p_id_regla INT,
    IN p_max_permisos INT,
    IN p_aplica ENUM('Universidad','Facultad'),
    IN p_id_facultad_fk INT,
    IN p_estado ENUM('Activa','Inactiva')
)
BEGIN
    DECLARE v_anio INT;
    DECLARE v_tipo_permiso VARCHAR(20);
    DECLARE v_aplica_actual VARCHAR(20);
    DECLARE v_id_facultad_actual INT;
    DECLARE v_estado_facultad VARCHAR(20);
    DECLARE v_existe_regla INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error durante la actualización de la regla';
    END;

    START TRANSACTION;

    /* 1. Validar Admin activo */
    IF fn_es_admin_activo(p_id_usuario_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo un Admin activo puede actualizar reglas';
    END IF;

    /* 2. Verificar existencia de la regla */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_reglas_permisos
        WHERE id_regla = p_id_regla
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La regla especificada no existe';
    END IF;

    /* Obtener datos actuales */
    SELECT año, tipo_permiso, aplica, id_facultad_fk
    INTO v_anio, v_tipo_permiso, v_aplica_actual, v_id_facultad_actual
    FROM tb_reglas_permisos
    WHERE id_regla = p_id_regla;

    /* 3. Validaciones de coherencia */
    IF p_max_permisos IS NOT NULL AND p_max_permisos <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El límite máximo debe ser mayor a cero';
    END IF;

    /* Validar facultad si aplica */
    IF COALESCE(p_aplica, v_aplica_actual) = 'Facultad' THEN
        IF COALESCE(p_id_facultad_fk, v_id_facultad_actual) IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Debe especificar una facultad cuando aplica a Facultad';
        END IF;

        SELECT estado
        INTO v_estado_facultad
        FROM tb_facultad
        WHERE id_facultad = COALESCE(p_id_facultad_fk, v_id_facultad_actual);

        IF v_estado_facultad IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad especificada no existe';
        END IF;

        IF v_estado_facultad <> 'Activa' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad especificada no está activa';
        END IF;
    END IF;

    /* 4. Verificar conflictos con reglas activas */
    SELECT COUNT(*)
    INTO v_existe_regla
    FROM tb_reglas_permisos
    WHERE id_regla <> p_id_regla
      AND año = v_anio
      AND tipo_permiso = v_tipo_permiso
      AND estado = 'Activa'
      AND aplica = COALESCE(p_aplica, v_aplica_actual)
      AND (
            (COALESCE(p_aplica, v_aplica_actual) = 'Universidad' AND id_facultad_fk IS NULL)
         OR (COALESCE(p_aplica, v_aplica_actual) = 'Facultad'
             AND id_facultad_fk = COALESCE(p_id_facultad_fk, v_id_facultad_actual))
      );

    IF v_existe_regla > 0 AND COALESCE(p_estado, 'Activa') = 'Activa' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe una regla activa con la misma configuración';
    END IF;

    /* 5. Actualizar regla */
    UPDATE tb_reglas_permisos
    SET
        max_permisos_dia = COALESCE(p_max_permisos, max_permisos_dia),
        aplica = COALESCE(p_aplica, aplica),
        id_facultad_fk = CASE
            WHEN COALESCE(p_aplica, aplica) = 'Facultad'
                THEN COALESCE(p_id_facultad_fk, id_facultad_fk)
            ELSE NULL
        END,
        estado = COALESCE(p_estado, estado),
        fecha_actualizacion = CURRENT_TIMESTAMP
    WHERE id_regla = p_id_regla;

    /* 6. Auditoría */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario_admin,
        'UPDATE',
        'tb_reglas_permisos',
        p_id_regla,
        CONCAT(
            'Actualización de regla. ',
            'Máx permisos: ', IFNULL(p_max_permisos, 'sin cambio'),
            ', Estado: ', COALESCE(p_estado, 'sin cambio')
        )
    );

    COMMIT;

    /* 7. Respuesta */
    SELECT
        id_regla,
        año,
        tipo_permiso,
        max_permisos_dia AS max_permisos,
        aplica,
        estado
    FROM tb_reglas_permisos
    WHERE id_regla = p_id_regla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_actualizar_usuario`(
    IN p_id_admin INT,
    IN p_id_usuario INT,
    IN p_email VARCHAR(100),
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_id_rol INT,
    IN p_contraseña_hash VARCHAR(255),
    IN p_estado VARCHAR(20)
)
BEGIN

    /* 1. Validar Admin */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado';
    END IF;

    /* 2. Validar usuario objetivo */
    IF NOT EXISTS (
        SELECT 1 FROM tb_usuario WHERE id_usuario = p_id_usuario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuario no existe';
    END IF;

    /* 3. Validar rol (si se quiere cambiar) */
    IF p_id_rol IS NOT NULL AND NOT EXISTS (
        SELECT 1 FROM tb_rol WHERE id_rol = p_id_rol AND estado = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rol inválido o inactivo';
    END IF;

    /* 4. Validar estado (si se quiere cambiar) */
    IF p_estado IS NOT NULL
       AND p_estado NOT IN ('Activo','Inactivo','Bloqueado','Suspendido') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estado inválido';
    END IF;

    /* 5. Validar email duplicado (si se quiere cambiar) */
    IF p_email IS NOT NULL THEN
        IF EXISTS (
            SELECT 1
            FROM tb_usuario
            WHERE email = p_email
              AND id_usuario != p_id_usuario
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El correo ya está registrado por otro usuario';
        END IF;
    END IF;

    /* 6. Actualización parcial */
    UPDATE tb_usuario
    SET
        email = IF(p_email IS NOT NULL, p_email, email),
        nombre = IF(p_nombre IS NOT NULL, p_nombre, nombre),
        apellido_paterno = IF(p_apellido_paterno IS NOT NULL, p_apellido_paterno, apellido_paterno),
        apellido_materno = IF(p_apellido_materno IS NOT NULL, p_apellido_materno, apellido_materno),
        id_rol = IF(p_id_rol IS NOT NULL, p_id_rol, id_rol),
        estado = IF(p_estado IS NOT NULL, p_estado, estado),
        password_hash = IF(p_contraseña_hash IS NOT NULL, p_contraseña_hash, password_hash)
    WHERE id_usuario = p_id_usuario;

    /* 7. Auditoría */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'ACTUALIZAR_USUARIO',
        'tb_usuario',
        p_id_usuario,
        'Actualización parcial de usuario'
    );

    /* 8. Respuesta */
    SELECT
        u.id_usuario,
        CONCAT(
            u.nombre,' ',
            u.apellido_paterno,' ',
            IFNULL(u.apellido_materno,'')
        ) AS nombre_completo,
        r.nombre AS rol,
        u.estado
    FROM tb_usuario u
    INNER JOIN tb_rol r ON r.id_rol = u.id_rol
    WHERE u.id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_actualiza_agremiado`(
    IN p_id_admin INT,
    IN p_id_usuario_fk INT,
    IN p_id_facultad_fk INT,
    IN p_tipo_contrato ENUM('Base','Interino','Honorarios'),
    IN p_tipo_jornada ENUM('Tiempo Completo','Medio Tiempo','Hora-Semana-Mes'),
    IN p_estado ENUM('Activo','Licencia','Baja','Jubilado'),
    IN p_departamento VARCHAR(100),
    IN p_puesto VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    /* 1. Validar Admin */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado';
    END IF;

    /* 2. Validar usuario Maestro y Activo */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_usuario u
        INNER JOIN tb_rol r ON r.id_rol = u.id_rol
        WHERE u.id_usuario = p_id_usuario_fk
          AND r.nombre = 'Maestro'
          AND u.estado = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuario no válido o no es Maestro activo';
    END IF;

    /* 3. Verificar si existe como agremiado */
    IF EXISTS (
        SELECT 1 FROM tb_agremiado WHERE id_usuario_fk = p_id_usuario_fk
    ) THEN
        /* Actualizar */
        UPDATE tb_agremiado
        SET
            id_facultad_fk = p_id_facultad_fk,
            tipo_contrato = p_tipo_contrato,
            tipo_jornada = p_tipo_jornada,
            estado = p_estado,
            departamento = IFNULL(p_departamento, departamento),
            puesto = IFNULL(p_puesto, puesto),
            fecha_actualizacion = CURRENT_TIMESTAMP
        WHERE id_usuario_fk = p_id_usuario_fk;
        
        /* Auditoría */
        CALL procedure_auditoria_registrar_evento21(
            p_id_admin,
            'ACTUALIZAR_AGREMIADO',
            'tb_agremiado',
            p_id_usuario_fk,
            'Actualización de datos de agremiado'
        );
    ELSE
        /* Crear */
        INSERT INTO tb_agremiado (
            id_usuario_fk,
            id_facultad_fk,
            tipo_contrato,
            tipo_jornada,
            estado,
            departamento,
            puesto
        ) VALUES (
            p_id_usuario_fk,
            p_id_facultad_fk,
            p_tipo_contrato,
            p_tipo_jornada,
            p_estado,
            p_departamento,
            p_puesto
        );
        
        /* Auditoría */
        CALL procedure_auditoria_registrar_evento21(
            p_id_admin,
            'CREAR_AGREMIADO',
            'tb_agremiado',
            LAST_INSERT_ID(),
            'Nuevo agremiado registrado'
        );
    END IF;

    COMMIT;

    /* Respuesta */
    SELECT 
        'EXITO' AS estado,
        'Operación realizada correctamente' AS mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_ajustar_dias_disponibles`(
    IN p_id_admin INT,
    IN p_id_usuario INT,
    IN p_ajuste_dias INT,
    IN p_motivo_ajuste TEXT
)
BEGIN
    DECLARE v_nombre_usuario VARCHAR(300);
    DECLARE v_matricula VARCHAR(30);
    DECLARE v_facultad VARCHAR(150);
    DECLARE v_dias_disponibles_actuales INT;
    DECLARE v_dias_disponibles_nuevos INT;
    DECLARE v_total_dias_anuales INT;
    DECLARE v_dias_usados INT;
    DECLARE v_id_solicitud INT;
	DECLARE v_mensaje_error TEXT;

    
    /* =====================================================
       1. Validar que el ejecutor sea Admin activo
    ===================================================== */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: se requieren privilegios de administrador';
    END IF;
    
    /* =====================================================
       2. Validar parámetros de entrada
    ===================================================== */
    IF p_ajuste_dias = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el ajuste de días no puede ser cero';
    END IF;
    
    IF p_motivo_ajuste IS NULL OR TRIM(p_motivo_ajuste) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: debe proporcionar un motivo válido para el ajuste';
    END IF;
    
    IF CHAR_LENGTH(TRIM(p_motivo_ajuste)) < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el motivo debe tener al menos 10 caracteres';
    END IF;
    
    /* =====================================================
       3. Obtener datos del maestro desde TU VISTA
    ===================================================== */
    SELECT 
        v.matricula,
        v.facultad,
        v.total_dias_anuales,
        v.dias_usados,
        v.dias_disponibles
    INTO 
        v_matricula,
        v_facultad,
        v_total_dias_anuales,
        v_dias_usados,
        v_dias_disponibles_actuales
    FROM vw_dias_disponibles v
    WHERE v.id_usuario_fk = p_id_usuario
    LIMIT 1;
    
    -- Si no existe en la vista, no es agremiado activo
    IF v_matricula IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el usuario no es un agremiado activo o no tiene días configurados';
    END IF;
    
    -- Obtener nombre del usuario
    SELECT CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', IFNULL(u.apellido_materno, ''))
    INTO v_nombre_usuario
    FROM tb_usuario u
    WHERE u.id_usuario = p_id_usuario;
    
    /* =====================================================
       4. Calcular nuevo saldo después del ajuste
    ===================================================== */
    SET v_dias_disponibles_nuevos = v_dias_disponibles_actuales + p_ajuste_dias;
    
    /* =====================================================
       5. Validar que el ajuste no genere valores negativos
    ===================================================== */
    IF v_dias_disponibles_nuevos < 0 THEN
	    SET v_mensaje_error = CONCAT(
	        'Error: el ajuste generaría días disponibles negativos. ',
	        'Días disponibles actuales: ', v_dias_disponibles_actuales,
	        ', Ajuste solicitado: ', p_ajuste_dias,
	        ', Resultado: ', v_dias_disponibles_nuevos
	    );
	
	    SIGNAL SQLSTATE '45000'
	    SET MESSAGE_TEXT = v_mensaje_error;
	END IF;

    
    /* =====================================================
       6. Validar límites razonables (no más de 100 días disponibles)
    ===================================================== */
   IF v_dias_disponibles_nuevos > 100 THEN
	    SET v_mensaje_error = CONCAT(
	        'Error: el ajuste generaría días disponibles excesivos (>100). ',
	        'Nuevos días disponibles: ', v_dias_disponibles_nuevos,
	        '. Si realmente necesita este ajuste, contacte al administrador del sistema.'
	    );
	
	    SIGNAL SQLSTATE '45000'
	    SET MESSAGE_TEXT = v_mensaje_error;
	END IF;

    
    /* =====================================================
       7. REGISTRAR EL AJUSTE como solicitud ficticia
    ===================================================== */
    -- Crear solicitud ficticia con días NEGATIVOS
    -- Esto hace que la vista reste de dias_usados = incrementa dias_disponibles
    --
    -- LÓGICA:
    -- Si admin quiere DAR +5 días → insertar -5 en dias_solicitados
    --    porque dias_disponibles = total - dias_usados
    --    y queremos que dias_usados BAJE en 5
    --
    -- Si admin quiere QUITAR -3 días → insertar +3 en dias_solicitados
    --    porque queremos que dias_usados SUBA en 3
    
    INSERT INTO tb_solicitud_permiso (
        id_usuario_fk,
        id_periodo_fk,
        tipo_permiso,
        fecha_inicio,
        fecha_fin,
        dias_solicitados,
        motivo,
        estado,
        fecha_aprobacion,
        comentarios_aprobador,
        fecha_solicitud
    ) VALUES (
        p_id_usuario,
        NULL,  -- Sin periodo porque es ajuste administrativo
        'Personal',  -- Usamos 'Personal' como tipo por defecto para ajustes
        CURDATE(),
        CURDATE(),
        -p_ajuste_dias,  -- NEGATIVO del ajuste solicitado
        CONCAT('🔧 AJUSTE ADMINISTRATIVO: ', p_motivo_ajuste),
        'Aprobado',
        CURRENT_TIMESTAMP,
        CONCAT(
            'Ajuste realizado por Admin ID:', p_id_admin, ' | ',
            'Cambio: ', IF(p_ajuste_dias > 0, '+', ''), p_ajuste_dias, ' días | ',
            'Disponibles antes: ', v_dias_disponibles_actuales, ' | ',
            'Disponibles después: ', v_dias_disponibles_nuevos
        ),
        CURRENT_TIMESTAMP
    );
    
    SET v_id_solicitud = LAST_INSERT_ID();
    
    /* =====================================================
       8. Registrar en auditoría (OBLIGATORIO)
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'AJUSTE_DIAS_DISPONIBLES',
        'tb_solicitud_permiso',
        v_id_solicitud,
        CONCAT(
            '🔧 AJUSTE ADMINISTRATIVO DE DÍAS - ',
            'Usuario: ', v_nombre_usuario, ' (ID:', p_id_usuario, ') | ',
            'Matrícula: ', v_matricula, ' | ',
            'Facultad: ', v_facultad, ' | ',
            'Total días anuales: ', v_total_dias_anuales, ' | ',
            'Días usados: ', v_dias_usados, ' | ',
            'Ajuste aplicado: ', IF(p_ajuste_dias > 0, '+', ''), p_ajuste_dias, ' días | ',
            'Días disponibles: ', v_dias_disponibles_actuales, ' → ', v_dias_disponibles_nuevos, ' | ',
            'Motivo: ', p_motivo_ajuste
        )
    );
    
    /* =====================================================
       9. Retornar resumen del ajuste realizado
    ===================================================== */
    SELECT 
        v_id_solicitud AS id_solicitud_ajuste,
        p_id_usuario AS id_usuario,
        v_nombre_usuario AS nombre_completo,
        v_matricula AS matricula,
        v_facultad AS facultad,
        YEAR(CURDATE()) AS año,
        v_total_dias_anuales AS total_dias_anuales,
        v_dias_usados AS dias_usados_antes_ajuste,
        v_dias_disponibles_actuales AS dias_disponibles_antes,
        p_ajuste_dias AS ajuste_aplicado,
        v_dias_disponibles_nuevos AS dias_disponibles_despues,
        p_motivo_ajuste AS motivo_ajuste,
        CURRENT_TIMESTAMP AS fecha_ajuste,
        CONCAT(
            '✅ Ajuste registrado exitosamente. ',
            'La vista vw_dias_disponibles ahora mostrará ', 
            v_dias_disponibles_nuevos, 
            ' días disponibles para este maestro.'
        ) AS mensaje;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_aprobar_solicitud`(
    IN p_id_admin INT,
    IN p_id_solicitud INT,
    IN p_comentarios TEXT
)
BEGIN
    DECLARE v_estado_actual VARCHAR(20);
    DECLARE v_tipo_permiso VARCHAR(20);
    DECLARE v_fecha_inicio DATE;
    DECLARE v_fecha_fin DATE;
    DECLARE v_dias_solicitados INT;
    DECLARE v_id_usuario_solicitante INT;
    DECLARE v_id_periodo INT;
    DECLARE v_estado_periodo VARCHAR(20);
    DECLARE v_id_facultad INT;
    DECLARE v_nombre_solicitante VARCHAR(255);
    DECLARE v_dias_disponibles INT;
    DECLARE v_msg TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    /* 1. Validar admin */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos';
    END IF;

    /* 2. Validar solicitud */
    IF NOT EXISTS (
        SELECT 1 FROM tb_solicitud_permiso
        WHERE id_solicitud = p_id_solicitud
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La solicitud no existe';
    END IF;

    /* 3. Obtener datos */
    SELECT 
        s.estado,
        s.tipo_permiso,
        s.fecha_inicio,
        s.fecha_fin,
        s.dias_solicitados,
        s.id_usuario_fk,
        s.id_periodo_fk,
        a.id_facultad_fk,
        CONCAT(
            u.nombre, ' ',
            u.apellido_paterno,
            IFNULL(CONCAT(' ', u.apellido_materno), '')
        )
    INTO
        v_estado_actual,
        v_tipo_permiso,
        v_fecha_inicio,
        v_fecha_fin,
        v_dias_solicitados,
        v_id_usuario_solicitante,
        v_id_periodo,
        v_id_facultad,
        v_nombre_solicitante
    FROM tb_solicitud_permiso s
    JOIN tb_usuario u ON u.id_usuario = s.id_usuario_fk
    JOIN tb_agremiado a ON a.id_usuario_fk = u.id_usuario
    WHERE s.id_solicitud = p_id_solicitud;

    /* 4. Estado pendiente */
    IF v_estado_actual <> 'Pendiente' THEN
        SET v_msg = CONCAT(
            'La solicitud no puede aprobarse. Estado actual: ',
            v_estado_actual
        );
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_msg;
    END IF;

    /* 5. Periodo activo */
    IF v_id_periodo IS NOT NULL THEN
        SELECT estado
        INTO v_estado_periodo
        FROM tb_periodo_vacacional
        WHERE id_periodo = v_id_periodo;

        IF v_estado_periodo <> 'Activo' THEN
            SET v_msg = CONCAT(
                'Periodo no activo. Estado: ',
                v_estado_periodo
            );
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = v_msg;
        END IF;
    END IF;

    /* 6. Reglas activas */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_reglas_permisos
        WHERE tipo_permiso = v_tipo_permiso
          AND anio = YEAR(v_fecha_inicio)
          AND estado = 'Activa'
          AND (
                (aplica = 'Universidad' AND id_facultad_fk IS NULL)
             OR (aplica = 'Facultad' AND id_facultad_fk = v_id_facultad)
          )
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existen reglas activas para este permiso';
    END IF;

    /* 7. Días disponibles */
    IF v_tipo_permiso = 'Vacaciones' THEN
        SELECT dias_disponibles
        INTO v_dias_disponibles
        FROM vw_dias_disponibles
        WHERE id_usuario_fk = v_id_usuario_solicitante;

        IF v_dias_solicitados > v_dias_disponibles THEN
            SET v_msg = CONCAT(
                'Días insuficientes. Solicitados: ',
                v_dias_solicitados,
                ', Disponibles: ',
                v_dias_disponibles
            );
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = v_msg;
        END IF;
    END IF;

    /* 8. Aprobar */
    UPDATE tb_solicitud_permiso
    SET estado = 'Aprobado',
        fecha_aprobacion = CURRENT_TIMESTAMP,
        comentarios_aprobador = p_comentarios
    WHERE id_solicitud = p_id_solicitud;

    /* 9. Auditoría */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'APROBAR_SOLICITUD',
        'tb_solicitud_permiso',
        p_id_solicitud,
        CONCAT(
            'Solicitud aprobada. ',
            'Solicitante: ', v_nombre_solicitante,
            ', Tipo: ', v_tipo_permiso,
            ', Días: ', v_dias_solicitados
        )
    );

    /* 10. Notificación */
    CALL _internal_crear_notificacion(
        v_id_usuario_solicitante,
        p_id_solicitud,
        'Solicitud Aprobada',
        CONCAT(
            'Su solicitud de ', v_tipo_permiso,
            ' del ', v_fecha_inicio,
            ' al ', v_fecha_fin,
            ' fue APROBADA.'
        ),
        'Aprobación',
        'Solicitud'
    );

    COMMIT;

    /* 11. Respuesta */
    SELECT
        p_id_solicitud AS id_solicitud,
        'Aprobado' AS estado,
        v_tipo_permiso AS tipo_permiso,
        v_fecha_inicio AS fecha_inicio,
        v_fecha_fin AS fecha_fin,
        v_dias_solicitados AS dias_solicitados,
        v_nombre_solicitante AS solicitante,
        CURRENT_TIMESTAMP AS fecha_aprobacion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_asignar_agremiado`(
    IN p_id_admin INT,
    IN p_id_usuario_fk INT,
    IN p_id_facultad_fk INT,
    IN p_matricula VARCHAR(30),
    IN p_tipo_contrato ENUM('Base', 'Interino', 'Honorarios'),
    IN p_tipo_jornada ENUM('Tiempo Completo', 'Medio Tiempo', 'Hora-Semana-Mes'),
    IN p_fecha_ingreso DATE,
    IN p_departamento VARCHAR(100),
    IN p_puesto VARCHAR(100)
)
BEGIN
    DECLARE v_rol_nombre VARCHAR(50);
    DECLARE v_estado_usuario ENUM('Activo', 'Inactivo', 'Bloqueado', 'Pendiente', 'Suspendido');
    DECLARE v_ya_es_agremiado INT DEFAULT 0;
    DECLARE v_existe_matricula INT DEFAULT 0;
    DECLARE v_id_agremiado INT;
    DECLARE v_nombre_usuario VARCHAR(300);
	DECLARE v_msg_error VARCHAR(255);

    
    /* =====================================================
       1. Validar que el ejecutor sea Admin activo
    ===================================================== */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: se requieren privilegios de administrador';
    END IF;
    
    /* =====================================================
       2. Verificar que el usuario exista y obtener su información
    ===================================================== */
    SELECT 
        r.nombre,
        u.estado,
        CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', IFNULL(u.apellido_materno, ''))
    INTO 
        v_rol_nombre,
        v_estado_usuario,
        v_nombre_usuario
    FROM tb_usuario u
    INNER JOIN tb_rol r ON r.id_rol = u.id_rol
    WHERE u.id_usuario = p_id_usuario_fk;
    
    IF v_rol_nombre IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el usuario no existe';
    END IF;
    
    /* =====================================================
       3. Validar que el rol sea Maestro
    ===================================================== */
    IF v_rol_nombre != 'Maestro' THEN
	    SET v_msg_error = CONCAT(
	        'Error: el usuario debe tener rol Maestro. Rol actual: ',
	        v_rol_nombre
	    );

	     SIGNAL SQLSTATE '45000'
	     SET MESSAGE_TEXT = v_msg_error;
	END IF;
    
    /* =====================================================
       4. Validar que el usuario esté Activo
    ===================================================== */
	 IF v_estado_usuario != 'Activo' THEN
	    SET v_msg_error = CONCAT(
	        'Error: el usuario debe estar activo. Estado actual: ',
	        v_estado_usuario
	    );
	
	    SIGNAL SQLSTATE '45000'
	    SET MESSAGE_TEXT = v_msg_error;
	END IF;
    
    /* =====================================================
       5. Comprobar que NO sea ya agremiado
    ===================================================== */
    SELECT COUNT(*)
    INTO v_ya_es_agremiado
    FROM tb_agremiado
    WHERE id_usuario_fk = p_id_usuario_fk;
    
    IF v_ya_es_agremiado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el usuario ya tiene un registro de agremiado';
    END IF;
    
    /* =====================================================
       6. Validar que la facultad exista
    ===================================================== */
    IF NOT EXISTS (
        SELECT 1 
        FROM tb_facultad 
        WHERE id_facultad = p_id_facultad_fk
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la facultad especificada no existe';
    END IF;
    
    /* =====================================================
       7. Validar que la matrícula no esté duplicada
    ===================================================== */
    SELECT COUNT(*)
    INTO v_existe_matricula
    FROM tb_agremiado
    WHERE matricula = p_matricula;
    
    IF v_existe_matricula > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la matrícula ya está registrada para otro agremiado';
    END IF;
    
    /* =====================================================
       8. Validar fecha de ingreso
    ===================================================== */
    IF p_fecha_ingreso IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la fecha de ingreso es obligatoria';
    END IF;
    
    IF p_fecha_ingreso > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la fecha de ingreso no puede ser futura';
    END IF;
    
    /* =====================================================
       9. Insertar nuevo registro en tb_agremiado
    ===================================================== */
    INSERT INTO tb_agremiado (
        id_usuario_fk,
        id_facultad_fk,
        matricula,
        tipo_contrato,
        tipo_jornada,
        fecha_ingreso,
        email,
        estado,
        anios_antiguedad,
        departamento,
        puesto,
        fecha_creacion,
        fecha_actualizacion
    ) VALUES (
        p_id_usuario_fk,
        p_id_facultad_fk,
        p_matricula,
        p_tipo_contrato,
        p_tipo_jornada,
        p_fecha_ingreso,
        (SELECT email FROM tb_usuario WHERE id_usuario = p_id_usuario_fk),  -- Copiar email del usuario
        'Activo',  -- Estado inicial
        0,  -- Años de antigüedad inicial (puede ser calculado por trigger)
        p_departamento,
        p_puesto,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
    
    SET v_id_agremiado = LAST_INSERT_ID();
    
    /* =====================================================
       10. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'ASIGNAR_AGREMIADO',
        'tb_agremiado',
        v_id_agremiado,
        CONCAT(
            'Usuario asignado como agremiado: ',
            v_nombre_usuario,
            ' (ID:', p_id_usuario_fk, ') | ',
            'Matrícula: ', p_matricula, ' | ',
            'Facultad ID: ', p_id_facultad_fk, ' | ',
            'Contrato: ', p_tipo_contrato, ' | ',
            'Jornada: ', p_tipo_jornada, ' | ',
            'Fecha ingreso: ', p_fecha_ingreso,
            IF(p_departamento IS NOT NULL, CONCAT(' | Depto: ', p_departamento), ''),
            IF(p_puesto IS NOT NULL, CONCAT(' | Puesto: ', p_puesto), '')
        )
    );
    
    /* =====================================================
       11. Devolver confirmación
    ===================================================== */
    SELECT 
        v_id_agremiado AS id_agremiado,
        p_id_usuario_fk AS id_usuario,
        v_nombre_usuario AS nombre_completo,
        p_matricula AS matricula,
        (SELECT nombre FROM tb_facultad WHERE id_facultad = p_id_facultad_fk) AS facultad,
        p_tipo_contrato AS tipo_contrato,
        p_tipo_jornada AS tipo_jornada,
        p_fecha_ingreso AS fecha_ingreso,
        p_departamento AS departamento,
        p_puesto AS puesto,
        'Activo' AS estado,
        'Usuario asignado como agremiado exitosamente' AS mensaje;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_crear_dia_no_habil`(
    IN p_id_usuario_admin INT,
    IN p_fecha DATE,
    IN p_descripcion VARCHAR(100),
    IN p_tipo ENUM('Festivo Nacional','Festivo Local','Puente','Administrativo','Otro'),
    IN p_aplica ENUM('Nacional','Universidad','Facultad'),
    IN p_id_facultad_fk INT
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    DECLARE v_estado_facultad VARCHAR(20);
    DECLARE v_id_dia_no_habil INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    resignal;
    END;

    START TRANSACTION;

    /* 1. Validar Admin activo */
    IF fn_es_admin_activo(p_id_usuario_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo un Admin activo puede registrar días no hábiles';
    END IF;

    /* 2. Evitar duplicados por fecha + ámbito */
    SELECT COUNT(*)
    INTO v_existe
    FROM tb_dias_no_habiles
    WHERE fecha = p_fecha
      AND aplica = p_aplica
      AND (
            (p_aplica <> 'Facultad' AND id_facultad_fk IS NULL)
         OR (p_aplica = 'Facultad' AND id_facultad_fk = p_id_facultad_fk)
      );

    IF v_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un día no hábil registrado para esa fecha y ámbito';
    END IF;

    /* 3. Validar coherencia aplica / facultad */
    IF p_aplica <> 'Facultad' AND p_id_facultad_fk IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se debe especificar facultad cuando no aplica a Facultad';
    END IF;

    IF p_aplica = 'Facultad' THEN
        IF p_id_facultad_fk IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Debe especificar una facultad cuando aplica a Facultad';
        END IF;

        SELECT estado
        INTO v_estado_facultad
        FROM tb_facultad
        WHERE id_facultad = p_id_facultad_fk;

        IF v_estado_facultad IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad especificada no existe';
        END IF;

        IF v_estado_facultad <> 'Activa' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad especificada no está activa';
        END IF;
    END IF;

    /* 4. Insertar día no hábil */
    INSERT INTO tb_dias_no_habiles (
        fecha,
        descripcion,
        tipo,
        aplica,
        id_facultad_fk
    ) VALUES (
        p_fecha,
        p_descripcion,
        p_tipo,
        p_aplica,
        CASE
            WHEN p_aplica = 'Facultad' THEN p_id_facultad_fk
            ELSE NULL
        END
    );

    SET v_id_dia_no_habil = LAST_INSERT_ID();

    /* 5. Auditoría */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario_admin,
        'INSERT',
        'tb_dias_no_habiles',
        v_id_dia_no_habil,
        CONCAT(
            'Alta de día no hábil: ',
            p_tipo,
            ' | Fecha: ',
            p_fecha,
            ' | Aplica: ',
            p_aplica
        )
    );

    COMMIT;

    /* 6. Respuesta */
    SELECT
        v_id_dia_no_habil AS id_dia_no_habil,
        p_fecha AS fecha,
        p_tipo AS tipo,
        p_aplica AS aplica;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_crear_facultad`(
    IN p_id_admin INT,
    IN p_nombre VARCHAR(150),
    IN p_direccion VARCHAR(200),
    IN p_email VARCHAR(200),
    IN p_telefono VARCHAR(20)
)
BEGIN
    DECLARE v_id_facultad INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al crear la facultad. Operación cancelada.';
    END;

    START TRANSACTION;

    /* 1. Validar que quien ejecuta sea Admin activo */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos';
    END IF;

    /* 2. Validar que el nombre de la facultad no exista */
    IF EXISTS (
        SELECT 1
        FROM tb_facultad
        WHERE nombre = p_nombre
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: ya existe una facultad con ese nombre';
    END IF;

    /* 3. Insertar la nueva facultad */
    INSERT INTO tb_facultad (
        nombre,
        direccion,
        email,
        telefono,
        estado
    ) VALUES (
        p_nombre,
        p_direccion,
        p_email,
        p_telefono,
        'Activa'
    );

    /* 4. Obtener ID generado */
    SET v_id_facultad = LAST_INSERT_ID();

    /* 5. Registrar auditoría */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'CREAR_FACULTAD',
        'tb_facultad',
        v_id_facultad,
        CONCAT(
            'El administrador creó la facultad: ',
            p_nombre
        )
    );
    COMMIT;
    /* 6. Devolver información al backend */
    SELECT
        v_id_facultad AS id_facultad,
        p_nombre AS nombre,
        'Activa' AS estado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_crear_notificacion`(
    IN p_id_usuario_admin INT,
    IN p_id_usuario_destino INT,
    IN p_id_solicitud INT,
    IN p_titulo VARCHAR(150),
    IN p_mensaje TEXT,
    IN p_tipo ENUM(
    'Aprobación',
    'Rechazo',
    'Recordatorio',
    'Vencimiento',
    'Nueva Solicitud',
    'Sistema'
),
    IN p_categoria ENUM(
    'Solicitud',
    'Alerta',
    'Información'
)
)
BEGIN
    DECLARE v_estado_usuario VARCHAR(20);
    DECLARE v_id_notificacion INT;

    -- 1. Validar Admin activo
    IF fn_es_admin_activo(p_id_usuario_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Solo un Admin activo puede crear notificaciones';
    END IF;

    -- 2. Validar usuario destinatario
    SELECT estado
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario_destino;

    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario destinatario no existe';
    END IF;

    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario destinatario no se encuentra activo';
    END IF;

    -- 3. Insertar notificación
    INSERT INTO tb_notificacion (
        id_usuario_fk,
        id_solicitud_fk,
        titulo,
        mensaje,
        tipo,
        categoria,
        leida,
        fecha_envio
    ) VALUES (
        p_id_usuario_destino,
        p_id_solicitud,
        p_titulo,
        p_mensaje,
        p_tipo,
        IFNULL(p_categoria, 'Información'),
        FALSE,
        CURRENT_TIMESTAMP
    );

    SET v_id_notificacion = LAST_INSERT_ID();

    -- 4. Auditoría
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario_admin,
        'INSERT',
        'tb_notificacion',
        v_id_notificacion,
        CONCAT(
            'Creación de notificación. Tipo: ',
            p_tipo,
            ', Categoría: ',
            IFNULL(p_categoria, 'Información'),
            ', Usuario destino ID: ',
            p_id_usuario_destino
        )
    );

    -- 5. Respuesta
    SELECT
        v_id_notificacion AS id_notificacion,
        p_id_usuario_destino AS id_usuario_destino,
        CURRENT_TIMESTAMP AS fecha_envio,
        'Notificación creada correctamente' AS resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_crear_periodo`(
    IN p_id_admin INT,
    IN p_anio INT,
    IN p_nombre_periodo VARCHAR(50),
    IN p_tipo_periodo ENUM('Vacacional','Receso'),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_tipo_personal ENUM('Todos','TC_MT','H-S-M'),
    IN p_dias_maximos INT,
    IN p_id_facultad_fk INT
)
BEGIN
    DECLARE v_estado_inicial ENUM('Proximo','Activo');
    DECLARE v_id_periodo INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        resignal;
    END;

    START TRANSACTION;

    /* 1. Validar Admin activo (FUNCIÓN OBLIGATORIA) */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos';
    END IF;

    /* 2. Validar fechas */
    IF p_fecha_inicio >= p_fecha_fin THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de inicio debe ser menor a la fecha de fin';
    END IF;

    /* 3. Validar facultad si aplica */
    IF p_id_facultad_fk IS NOT NULL THEN
        IF NOT EXISTS (
            SELECT 1
            FROM tb_facultad
            WHERE id_facultad = p_id_facultad_fk
              AND estado = 'Activa'
        ) THEN
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad no existe o está inactiva';
        END IF;
    END IF;

    /* 4. Evitar traslapes de periodos */
    IF EXISTS (
        SELECT 1
        FROM tb_periodo_vacacional p
        WHERE p.anio = p_anio
          AND p.tipo_periodo = p_tipo_periodo
          AND p.tipo_personal = p_tipo_personal
          AND (
                (p_id_facultad_fk IS NULL AND p.id_facultad_fk IS NULL)
             OR (p_id_facultad_fk IS NOT NULL AND p.id_facultad_fk = p_id_facultad_fk)
          )
          AND (
                p_fecha_inicio <= p.fecha_fin_periodo
            AND p_fecha_fin >= p.fecha_inicio_periodo
          )
    ) THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Existe un periodo que se traslapa con las fechas proporcionadas';
    END IF;

    /* 5. Definir estado inicial */
    IF p_fecha_inicio <= CURDATE() THEN
        SET v_estado_inicial = 'Activo';
    ELSE
        SET v_estado_inicial = 'Proximo';
    END IF;

    /* 6. Insertar periodo */
    INSERT INTO tb_periodo_vacacional (
        anio,
        nombre_periodo,
        tipo_periodo,
        fecha_inicio_periodo,
        fecha_fin_periodo,
        tipo_personal,
        dias_maximos,
        id_facultad_fk,
        estado
    ) VALUES (
        p_anio,
        p_nombre_periodo,
        p_tipo_periodo,
        p_fecha_inicio,
        p_fecha_fin,
        p_tipo_personal,
        p_dias_maximos,
        p_id_facultad_fk,
        v_estado_inicial
    );
    SET v_id_periodo = LAST_INSERT_ID();
    /* 7. Auditoría  */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'INSERT',
        'tb_periodo_vacacional',
        v_id_periodo,
        CONCAT(
            'Creación de periodo ',
            p_tipo_periodo,
            ' (', p_nombre_periodo, ') ',
            'Año ', p_anio,
            ' | Estado inicial: ', v_estado_inicial
        )
    );

    COMMIT;

    /* 8. Respuesta al backend */
    SELECT
        v_id_periodo AS id_periodo,
        p_nombre_periodo AS nombre_periodo,
        p_tipo_periodo AS tipo_periodo,
        p_anio AS anio,
        v_estado_inicial AS estado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_crear_regla`(
    IN p_id_usuario_admin INT,
    IN p_anio INT,
    IN p_tipo_permiso ENUM('Vacaciones','Economico','Personal','Medico'),
    IN p_max_permisos INT,
    IN p_aplica ENUM('Universidad','Facultad'),
    IN p_id_facultad_fk INT,
    IN p_estado ENUM('Activa','Inactiva')
)
proc:BEGIN
    DECLARE v_estado_facultad VARCHAR(20);
    DECLARE v_existe_regla INT DEFAULT 0;
    DECLARE v_estado_final ENUM('Activa','Inactiva') DEFAULT 'Activa';
    DECLARE v_id_regla INT;

    /* =========================
       Manejo de errores
    ========================= */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        resignal;
    END;
    START TRANSACTION;
    /* =========================
       1. Validar Admin activo
    ========================= */
    IF fn_es_admin_activo(p_id_usuario_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo un administrador activo puede crear reglas';
    END IF;

    /* =========================
       2. Validar año
    ========================= */
    IF p_anio < 2000 OR p_anio > YEAR(CURDATE()) + 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El año proporcionado no es válido';
    END IF;

    /* =========================
       3. Validar máximo de permisos
    ========================= */
    IF p_max_permisos <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El máximo de permisos debe ser mayor a cero';
    END IF;

    /* =========================
       4. Definir estado final
    ========================= */
    IF p_estado IS NOT NULL THEN
        SET v_estado_final = p_estado;
    END IF;

    /* =========================
       5. Validar facultad si aplica
    ========================= */
    IF p_aplica = 'Facultad' THEN

        IF p_id_facultad_fk IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Debe especificar una facultad cuando la regla aplica a Facultad';
        END IF;

        SELECT estado
        INTO v_estado_facultad
        FROM tb_facultad
        WHERE id_facultad = p_id_facultad_fk;

        IF v_estado_facultad IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad especificada no existe';
        END IF;

        IF v_estado_facultad <> 'Activa' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La facultad especificada no está activa';
        END IF;

    ELSE
        SET p_id_facultad_fk = NULL;
    END IF;

    /* =========================
       6. Verificar duplicados activos
    ========================= */
    SELECT COUNT(*)
    INTO v_existe_regla
    FROM tb_reglas_permisos
    WHERE anio = p_anio
      AND tipo_permiso = p_tipo_permiso
      AND aplica = p_aplica
      AND estado = 'Activa'
      AND (
            (p_aplica = 'Universidad' AND id_facultad_fk IS NULL)
         OR (p_aplica = 'Facultad' AND id_facultad_fk = p_id_facultad_fk)
      );

    IF v_existe_regla > 0 AND v_estado_final = 'Activa' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe una regla activa con los mismos criterios';
    END IF;

    /* =========================
       7. Insertar regla
    ========================= */
    INSERT INTO tb_reglas_permisos (
        anio,
        tipo_permiso,
        max_permisos_dia,
        aplica,
        id_facultad_fk,
        estado
    ) VALUES (
        p_anio,
        p_tipo_permiso,
        p_max_permisos,
        p_aplica,
        p_id_facultad_fk,
        v_estado_final
    );

    SET v_id_regla = LAST_INSERT_ID();

    /* =========================
       8. Auditoría
    ========================= */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario_admin,
        'INSERT',
        'tb_reglas_permisos',
        v_id_regla,
        CONCAT(
            'Creación de regla de permisos. ',
            'Año: ', p_anio,
            ', Tipo: ', p_tipo_permiso,
            ', Aplica: ', p_aplica,
            ', Estado: ', v_estado_final
        )
    );

    COMMIT;

    /* =========================
       9. Respuesta al backend
    ========================= */
    SELECT
        v_id_regla AS id_regla,
        p_anio AS anio,
        p_tipo_permiso AS tipo_permiso,
        p_max_permisos AS max_permisos,
        p_aplica AS aplica,
        v_estado_final AS estado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_crear_usuario`(
    IN p_id_admin INT,
    IN p_email VARCHAR(100),
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_id_rol INT,
    IN p_contraseña_hash VARCHAR(255)
)
BEGIN
    DECLARE v_id_usuario INT;
    
      /* 1. Validar Admin */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado';
    END IF;

    /* 2. Verificar que el correo no exista */
    IF EXISTS (
        SELECT 1
        FROM tb_usuario
        WHERE email = p_email
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el correo ya está registrado';
    END IF;

    /* 3. Validar que el rol exista y esté activo */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_rol
        WHERE id_rol = p_id_rol
          AND estado = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: rol inválido o inactivo';
    END IF;

    /* 5. Insertar el nuevo usuario */
    INSERT INTO tb_usuario (
        email,
        password_hash,
        nombre,
        apellido_paterno,
        apellido_materno,
        id_rol,
        estado
    ) VALUES (
        p_email,
        p_contraseña_hash,
        p_nombre,
        p_apellido_paterno,
        p_apellido_materno,
        p_id_rol,
        'Activo'
    );

    /* Obtener el ID del usuario creado */
    SET v_id_usuario = LAST_INSERT_ID();

    /* Actualizar último acceso */
    UPDATE tb_usuario
    SET ultimo_acceso = CURRENT_TIMESTAMP()
    WHERE id_usuario = v_id_usuario;

    /* 6. Registrar auditoría (acción realizada por el ADMIN) */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'CREAR_USUARIO',
        'tb_usuario',
        v_id_usuario,
        CONCAT(
            'El administrador creó el usuario con email: ',
            p_email,
            ' y rol ID: ',
            p_id_rol
        )
    );

    /* 7. Devolver información básica al backend */
    SELECT
        v_id_usuario AS id_usuario,
        CONCAT(
            p_nombre, ' ',
            p_apellido_paterno, ' ',
            IFNULL(p_apellido_materno, '')
        ) AS nombre_completo,
        (SELECT nombre FROM tb_rol WHERE id_rol = p_id_rol) AS rol,
        'Activo' AS estado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_desactivar_regla`(
    IN p_id_usuario_admin INT,
    IN p_id_regla INT
)
BEGIN
    DECLARE v_estado_actual VARCHAR(20);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        resignal;
    END;

    START TRANSACTION;

    /* 1. Validar Admin activo */
    IF fn_es_admin_activo(p_id_usuario_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo un Admin activo puede desactivar reglas';
    END IF;

    /* 2. Verificar existencia de la regla */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_reglas_permisos
        WHERE id_regla = p_id_regla
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La regla especificada no existe';
    END IF;

    /* Obtener estado actual */
    SELECT estado
    INTO v_estado_actual
    FROM tb_reglas_permisos
    WHERE id_regla = p_id_regla;

    /* 3. Validar que no esté ya inactiva */
    IF v_estado_actual = 'Inactiva' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La regla ya se encuentra inactiva';
    END IF;

    /* 4. Desactivar regla */
    UPDATE tb_reglas_permisos
    SET
        estado = 'Inactiva',
        fecha_actualizacion = CURRENT_TIMESTAMP
    WHERE id_regla = p_id_regla;

    /* 5. Auditoría */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario_admin,
        'UPDATE',
        'tb_reglas_permisos',
        p_id_regla,
        'Regla desactivada (estado cambiado a Inactiva)'
    );

    COMMIT;

    /* 6. Respuesta */
    SELECT
        id_regla,
        estado,
        'Regla desactivada correctamente' AS mensaje
    FROM tb_reglas_permisos
    WHERE id_regla = p_id_regla;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_eliminar_usuario`(
    IN p_id_admin INT,
    IN p_id_usuario INT
)
BEGIN
    /* 1. Validar que quien ejecuta sea Admin activo */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos';
    END IF;

    /* 2. Verificar que el usuario exista */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_usuario
        WHERE id_usuario = p_id_usuario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el usuario no existe';
    END IF;

    /* 3. Evitar bloquear a otro Admin (opcional pero recomendado) */
    IF EXISTS (
        SELECT 1
        FROM tb_usuario u
        INNER JOIN tb_rol r ON r.id_rol = u.id_rol
        WHERE u.id_usuario = p_id_usuario
          AND r.nombre = 'Admin'
          AND u.estado = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede bloquear a un administrador activo';
    END IF;

    /* 4. Bloquear usuario */
    UPDATE tb_usuario
    SET estado = 'Bloqueado'
    WHERE id_usuario = p_id_usuario
      AND estado <> 'Bloqueado';

    /* 5. Registrar auditoría (quién lo hizo) */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'BLOQUEAR_USUARIO',
        'tb_usuario',
        p_id_usuario,
        'El administrador bloqueó la cuenta del usuario'
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_elimina_dia_no_habil`(
    IN p_id_usuario_admin INT,
    IN p_id_dia_no_habil INT
)
proc:BEGIN
    DECLARE v_existe INT DEFAULT 0;
    DECLARE v_estado VARCHAR(20);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        resignal;
    END;

    START TRANSACTION;

    -- 1. Validar que el usuario sea Admin activo
    IF fn_es_admin_activo(p_id_usuario_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo un Admin activo puede eliminar días no hábiles';
    END IF;

    -- 2. Verificar que el día no hábil exista
    SELECT COUNT(*)
    INTO v_existe
    FROM tb_dias_no_habiles
    WHERE id_dia_no_habil = p_id_dia_no_habil;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El día no hábil especificado no existe';
    END IF;

    -- 3. Validar que esté activo
    SELECT estado
    INTO v_estado
    FROM tb_dias_no_habiles
    WHERE id_dia_no_habil = p_id_dia_no_habil;

    IF v_estado <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El día no hábil ya se encuentra inactivo';
    END IF;

    -- 4. Marcar como inactivo
    UPDATE tb_dias_no_habiles
    SET estado = 'Inactivo',
        fecha_actualizacion = CURRENT_TIMESTAMP
    WHERE id_dia_no_habil = p_id_dia_no_habil;

    -- 5. Auditoría
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario_admin,
        'UPDATE',
        'tb_dias_no_habiles',
        p_id_dia_no_habil,
        'Desactivación de día no hábil (estado Inactivo)'
    );

    COMMIT;

    -- 6. Confirmación
    SELECT 
        p_id_dia_no_habil AS id_dia_no_habil,
        'Día no hábil desactivado correctamente' AS mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_listar_solicitudes_pendientes`(
    IN p_id_admin INT
)
BEGIN
    /* 1. Validar Admin activo */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos';
    END IF;
    
    /* 2. Consultar solicitudes pendientes */
    SELECT
        s.id_solicitud,
        s.id_usuario_fk,
        CONCAT(u.nombre, ' ', u.apellido_paterno, IFNULL(CONCAT(' ', u.apellido_materno), '')) AS nombre_completo,
        a.matricula,
        f.nombre AS facultad,
        s.tipo_permiso,
        s.fecha_inicio,
        s.fecha_fin,
        s.dias_solicitados,
        s.motivo,
        s.fecha_solicitud,
        s.estado,
        CASE 
            WHEN s.id_periodo_fk IS NOT NULL 
            THEN CONCAT(pv.nombre_periodo, ' (', pv.anio, ')')  -- SIN ñ
            ELSE 'N/A'
        END AS periodo_vacacional,
        a.tipo_contrato,
        a.tipo_jornada,
        a.departamento,
        a.puesto,
        CASE 
            WHEN s.tipo_permiso = 'Vacaciones' THEN
                (SELECT dias_disponibles FROM vw_dias_disponibles WHERE id_usuario_fk = s.id_usuario_fk)
            ELSE NULL
        END AS dias_disponibles_actual,
        DATEDIFF(CURDATE(), s.fecha_solicitud) AS dias_desde_solicitud
    FROM tb_solicitud_permiso s
    INNER JOIN tb_usuario u ON s.id_usuario_fk = u.id_usuario
    INNER JOIN tb_agremiado a ON a.id_usuario_fk = u.id_usuario
    INNER JOIN tb_facultad f ON a.id_facultad_fk = f.id_facultad
    LEFT JOIN tb_periodo_vacacional pv ON s.id_periodo_fk = pv.id_periodo
    WHERE s.estado = 'Pendiente'
    ORDER BY s.fecha_solicitud ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_listar_usuarios`(
in p_estado varchar(20),
in p_id_admin int,
in p_rol varchar(20)
)
BEGIN
declare v_id_usuario int;
 /* 1. Validar Admin */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado';
    END IF;
  
-- 2.	Construir consulta SELECT controlada.
  select u.id_usuario, concat(u.nombre,' ', u.apellido_paterno,' ', u.apellido_materno,' ') as 'Nombre Completo',
  u.email,r.nombre as Rol, u.estado,u.fecha_creacion,u.ultimo_acceso,
  case 
     when a.id_agremiado is not null then 'Si'
     else'No'
  end as 'Es agremiado'
  from tb_usuario u inner join tb_rol r on r.id_rol = u.id_rol left join tb_agremiado a on a.id_usuario_fk=u.id_usuario and a.estado='Activo'
  where(p_estado is null or u.estado=p_estado) and (p_rol is null or r.nombre=p_rol)
  order by u.fecha_creacion DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_admin_rechazar_solicitud`(
    IN p_id_admin INT,
    IN p_id_solicitud INT,
    IN p_motivo_rechazo TEXT
)
BEGIN
    DECLARE v_estado_solicitud ENUM('Pendiente','Aprobado','Rechazado','Cancelado');
    DECLARE v_id_usuario_solicitante INT;
    DECLARE v_tipo_permiso ENUM('Vacaciones','Economico','Personal','Medico');
    DECLARE v_fecha_inicio DATE;
    DECLARE v_fecha_fin DATE;
    DECLARE v_dias_solicitados INT;
    DECLARE v_nombre_solicitante VARCHAR(255);
    declare v_mensaje_error varchar(255);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
   
    /* =====================================================
       1. Validar que el usuario sea Admin activo
    ===================================================== */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: solo administradores activos pueden rechazar solicitudes';
    END IF;
    
    /* =====================================================
       2. Obtener información de la solicitud y validar existencia
    ===================================================== */
    SELECT 
        s.estado,
        s.id_usuario_fk,
        s.tipo_permiso,
        s.fecha_inicio,
        s.fecha_fin,
        s.dias_solicitados,
        CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', IFNULL(u.apellido_materno, ''))
    INTO 
        v_estado_solicitud,
        v_id_usuario_solicitante,
        v_tipo_permiso,
        v_fecha_inicio,
        v_fecha_fin,
        v_dias_solicitados,
        v_nombre_solicitante
    FROM tb_solicitud_permiso s
    INNER JOIN tb_usuario u ON s.id_usuario_fk = u.id_usuario
    WHERE s.id_solicitud = p_id_solicitud;
    
    /* Validar que la solicitud exista */
    IF v_estado_solicitud IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La solicitud especificada no existe';
    END IF;
    
    /* =====================================================
       3. Validar que la solicitud esté Pendiente
    ===================================================== */
    IF v_estado_solicitud <> 'Pendiente' THEN 
         SET v_mensaje_error = CONCAT(
            'La solicitud no puede ser rechazada. Estado actual: ',
            v_estado_solicitud
        );
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensaje_error;
    END IF;
    
    /* =====================================================
       4. Validar que el motivo de rechazo sea válido
    ===================================================== */
    IF p_motivo_rechazo IS NULL OR TRIM(p_motivo_rechazo) = '' THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El motivo de rechazo es obligatorio y no puede estar vacío';
    END IF;
    
    /* =====================================================
       5. Actualizar la solicitud a estado Rechazado
          Nota: fecha_actualizacion se actualiza automáticamente
    ===================================================== */
    UPDATE tb_solicitud_permiso
    SET 
        estado = 'Rechazado',
        motivo_rechazado = p_motivo_rechazo
        -- fecha_actualizacion se actualiza sola (ON UPDATE CURRENT_TIMESTAMP)
    WHERE id_solicitud = p_id_solicitud;
    
    /* =====================================================
       6. Registrar en auditoría con detalles completos
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'RECHAZAR_SOLICITUD',
        'tb_solicitud_permiso',
        p_id_solicitud,
        CONCAT(
            'Solicitud rechazada. Solicitante: ',
            v_nombre_solicitante,
            '. Tipo: ', v_tipo_permiso,
            '. Días: ', v_dias_solicitados,
            '. Periodo: ', v_fecha_inicio, ' al ', v_fecha_fin,
            '. Motivo rechazo: ', LEFT(p_motivo_rechazo, 100)
        )
    );
    
    /* =====================================================
       7. Crear notificación para el solicitante
    ===================================================== */
    CALL _internal_crear_notificacion(
        v_id_usuario_solicitante,
        p_id_solicitud,
        'Solicitud Rechazada',
        CONCAT(
            'Su solicitud de ', v_tipo_permiso, 
            ' del ', v_fecha_inicio, ' al ', v_fecha_fin,
            ' ha sido RECHAZADA.',
            ' Motivo: ', p_motivo_rechazo
        ),
        'Rechazo',
        'Solicitud'
    );
    
    COMMIT;
    
    /* =====================================================
       8. Respuesta con información completa
    ===================================================== */
    SELECT
        p_id_solicitud AS id_solicitud,
        'Rechazado' AS estado,
        v_tipo_permiso AS tipo_permiso,
        v_fecha_inicio AS fecha_inicio,
        v_fecha_fin AS fecha_fin,
        v_dias_solicitados AS dias_solicitados,
        v_nombre_solicitante AS solicitante,
        p_motivo_rechazo AS motivo_rechazo,
        CURRENT_TIMESTAMP AS fecha_rechazo,
        'Solicitud rechazada correctamente. Se ha notificado al solicitante.' AS mensaje;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_reporte_dias_usados_por_maestro`(
    IN p_id_admin INT,
    IN p_anio_consulta INT,
    IN p_id_usuario INT
)
BEGIN
    DECLARE v_anio INT;
    
    /* =====================================================
       1. Validar que el ejecutor sea Admin activo
    ===================================================== */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: se requieren privilegios de administrador';
    END IF;
    
    /* =====================================================
       2. Establecer año de consulta (actual si no se especifica)
    ===================================================== */
    SET v_anio = IFNULL(p_anio_consulta, YEAR(CURRENT_DATE));
    
    /* =====================================================
       3. Generar reporte de días usados por maestro
    ===================================================== */
    SELECT 
        -- Información del maestro
        u.id_usuario,
        CONCAT(
            u.nombre, ' ',
            u.apellido_paterno, ' ',
            IFNULL(u.apellido_materno, '')
        ) AS nombre_completo_maestro,
        u.email,
        
        -- Información de agremiado (si aplica)
        a.matricula,
        a.tipo_contrato,
        a.tipo_jornada,
        f.nombre AS facultad,
        a.departamento,
        a.puesto,
        
        -- Tipo de permiso
        s.tipo_permiso,
        
        -- Estadísticas de uso
        COUNT(s.id_solicitud) AS total_solicitudes_aprobadas,
        SUM(s.dias_solicitados) AS total_dias_usados,
        
        -- Promedio de días por solicitud
        ROUND(AVG(s.dias_solicitados), 2) AS promedio_dias_por_solicitud,
        
        -- Año de consulta
        v_anio AS año,
        
        -- Fechas de las solicitudes
        MIN(s.fecha_inicio) AS primera_solicitud_fecha,
        MAX(s.fecha_fin) AS ultima_solicitud_fecha,
        
        -- Indicador de uso intensivo
        CASE
            WHEN s.tipo_permiso = 'Vacaciones' AND SUM(s.dias_solicitados) > 20 THEN 'Alto'
            WHEN s.tipo_permiso = 'Economico' AND SUM(s.dias_solicitados) > 6 THEN 'Alto'
            WHEN s.tipo_permiso = 'Personal' AND SUM(s.dias_solicitados) > 10 THEN 'Alto'
            WHEN s.tipo_permiso = 'Medico' AND SUM(s.dias_solicitados) > 15 THEN 'Alto'
            ELSE 'Normal'
        END AS nivel_uso
        
    FROM tb_usuario u
    
    -- INNER JOIN con solicitudes aprobadas
    INNER JOIN tb_solicitud_permiso s 
        ON s.id_usuario_fk = u.id_usuario
        AND s.estado = 'Aprobado'
        AND YEAR(s.fecha_inicio) = v_anio
    
    -- LEFT JOIN con agremiado (puede no ser agremiado)
    LEFT JOIN tb_agremiado a 
        ON a.id_usuario_fk = u.id_usuario
    
    -- LEFT JOIN con facultad (depende de si es agremiado)
    LEFT JOIN tb_facultad f 
        ON f.id_facultad = a.id_facultad_fk
    
    WHERE 1=1
        -- Filtro por usuario específico (si se proporciona)
        AND (p_id_usuario IS NULL OR u.id_usuario = p_id_usuario)
        
        -- Solo usuarios activos
        AND u.estado = 'Activo'
    
    -- Agrupar por maestro y tipo de permiso
    GROUP BY u.id_usuario, s.tipo_permiso
    
    -- Ordenar por facultad, nombre y tipo de permiso
    ORDER BY f.nombre, u.apellido_paterno, u.apellido_materno, u.nombre, s.tipo_permiso;
    
    /* =====================================================
       4. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'GENERAR_REPORTE',
        'tb_solicitud_permiso',
        NULL,
        CONCAT(
            'Admin generó reporte de días usados por maestro. Filtros: ',
            'Año=', v_anio, ', ',
            'Usuario=', IFNULL(p_id_usuario, 'Todos')
        )
    );
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_reporte_permisos_por_facultad`(
    IN p_id_admin INT,
    IN p_anio_consulta INT
)
BEGIN
    DECLARE v_anio INT;
    
    /* =====================================================
       1. Validar que el ejecutor sea Admin activo
    ===================================================== */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: se requieren privilegios de administrador';
    END IF;
    
    /* =====================================================
       2. Establecer año de consulta (actual si no se especifica)
    ===================================================== */
    SET v_anio = IFNULL(p_anio_consulta, YEAR(CURRENT_DATE));
    
    /* =====================================================
       3. Generar reporte estadístico por facultad
    ===================================================== */
    SELECT 
        -- Información de la facultad
        f.id_facultad,
        f.nombre AS facultad,
        f.direccion,
        f.email AS email_facultad,
        f.telefono AS telefono_facultad,
        f.estado AS estado_facultad,
        
        -- Estadísticas generales
        COUNT(DISTINCT a.id_agremiado) AS total_agremiados,
        COUNT(DISTINCT s.id_usuario_fk) AS maestros_con_permisos,
        COUNT(s.id_solicitud) AS total_solicitudes_aprobadas,
        SUM(s.dias_solicitados) AS total_dias_utilizados,
        
        -- Estadísticas por tipo de permiso (solo los 4 que existen)
        SUM(CASE WHEN s.tipo_permiso = 'Vacaciones' THEN 1 ELSE 0 END) AS solicitudes_vacaciones,
        SUM(CASE WHEN s.tipo_permiso = 'Vacaciones' THEN s.dias_solicitados ELSE 0 END) AS dias_vacaciones,
        
        SUM(CASE WHEN s.tipo_permiso = 'Economico' THEN 1 ELSE 0 END) AS solicitudes_economico,
        SUM(CASE WHEN s.tipo_permiso = 'Economico' THEN s.dias_solicitados ELSE 0 END) AS dias_economico,
        
        SUM(CASE WHEN s.tipo_permiso = 'Personal' THEN 1 ELSE 0 END) AS solicitudes_personal,
        SUM(CASE WHEN s.tipo_permiso = 'Personal' THEN s.dias_solicitados ELSE 0 END) AS dias_personal,
        
        SUM(CASE WHEN s.tipo_permiso = 'Medico' THEN 1 ELSE 0 END) AS solicitudes_medico,
        SUM(CASE WHEN s.tipo_permiso = 'Medico' THEN s.dias_solicitados ELSE 0 END) AS dias_medico,
        
        -- Promedios
        ROUND(AVG(s.dias_solicitados), 2) AS promedio_dias_por_solicitud,
        ROUND(
            SUM(s.dias_solicitados) / NULLIF(COUNT(DISTINCT s.id_usuario_fk), 0),
            2
        ) AS promedio_dias_por_maestro,
        
        -- Estadísticas por tipo de contrato
        SUM(CASE WHEN a.tipo_contrato = 'Base' AND s.id_solicitud IS NOT NULL THEN 1 ELSE 0 END) AS solicitudes_base,
        SUM(CASE WHEN a.tipo_contrato = 'Interino' AND s.id_solicitud IS NOT NULL THEN 1 ELSE 0 END) AS solicitudes_interino,
        SUM(CASE WHEN a.tipo_contrato = 'Honorarios' AND s.id_solicitud IS NOT NULL THEN 1 ELSE 0 END) AS solicitudes_honorarios,
        
        -- Año de consulta
        v_anio AS año_consultado,
        
        -- Indicadores de uso
        CASE
            WHEN SUM(s.dias_solicitados) > 500 THEN 'Muy Alto'
            WHEN SUM(s.dias_solicitados) > 300 THEN 'Alto'
            WHEN SUM(s.dias_solicitados) > 100 THEN 'Medio'
            ELSE 'Bajo'
        END AS nivel_uso_facultad,
        
        -- Porcentaje de participación (maestros que usaron permisos)
        ROUND(
            (COUNT(DISTINCT s.id_usuario_fk) / NULLIF(COUNT(DISTINCT a.id_agremiado), 0)) * 100,
            2
        ) AS porcentaje_participacion
        
    FROM tb_facultad f
    
    -- LEFT JOIN con agremiados (puede haber facultades sin agremiados)
    LEFT JOIN tb_agremiado a 
        ON a.id_facultad_fk = f.id_facultad
        AND a.estado = 'Activo'
    
    -- LEFT JOIN con solicitudes aprobadas del año especificado
    LEFT JOIN tb_solicitud_permiso s
        ON s.id_usuario_fk = a.id_usuario_fk
        AND s.estado = 'Aprobado'
        AND YEAR(s.fecha_inicio) = v_anio
    
    WHERE f.estado = 'Activa'
    
    -- Agrupar por facultad
    GROUP BY f.id_facultad
    
    -- Ordenar por total de días utilizados (mayor a menor)
    ORDER BY total_dias_utilizados DESC;
    
    /* =====================================================
       4. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'GENERAR_REPORTE',
        'tb_facultad',
        NULL,
        CONCAT(
            'Admin generó reporte de permisos por facultad. Año consultado: ', v_anio
        )
    );
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_reporte_solicitudes_por_periodo`(
    IN p_id_admin INT,
    IN p_id_periodo INT,
    IN p_anio INT
)
BEGIN
    /* =====================================================
       1. Validar que el ejecutor sea Admin activo
    ===================================================== */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: se requieren privilegios de administrador';
    END IF;
    
    /* =====================================================
       2. Generar reporte estadístico agrupado por periodo
    ===================================================== */
    SELECT 
        -- Información del periodo
        p.id_periodo,
        p.nombre_periodo,
        p.tipo_periodo,
        p.anio,
        p.fecha_inicio_periodo,
        p.fecha_fin_periodo,
        p.tipo_personal,
        p.estado AS estado_periodo,
        
        -- Estadísticas de solicitudes
        COUNT(s.id_solicitud) AS total_solicitudes,
        
        -- Contar por estado
        SUM(CASE WHEN s.estado = 'Pendiente' THEN 1 ELSE 0 END) AS solicitudes_pendientes,
        SUM(CASE WHEN s.estado = 'Aprobado' THEN 1 ELSE 0 END) AS solicitudes_aprobadas,
        SUM(CASE WHEN s.estado = 'Rechazado' THEN 1 ELSE 0 END) AS solicitudes_rechazadas,
        SUM(CASE WHEN s.estado = 'Cancelado' THEN 1 ELSE 0 END) AS solicitudes_canceladas,
        
        -- Estadísticas de días
        SUM(CASE WHEN s.estado = 'Aprobado' THEN s.dias_solicitados ELSE 0 END) AS total_dias_aprobados,
        SUM(CASE WHEN s.estado = 'Pendiente' THEN s.dias_solicitados ELSE 0 END) AS total_dias_pendientes,
        
        -- Promedio de días por solicitud aprobada
        ROUND(
            AVG(CASE WHEN s.estado = 'Aprobado' THEN s.dias_solicitados ELSE NULL END),
            2
        ) AS promedio_dias_aprobados,
        
        -- Porcentajes
        ROUND(
            (SUM(CASE WHEN s.estado = 'Aprobado' THEN 1 ELSE 0 END) / COUNT(s.id_solicitud)) * 100,
            2
        ) AS porcentaje_aprobacion,
        
        ROUND(
            (SUM(CASE WHEN s.estado = 'Rechazado' THEN 1 ELSE 0 END) / COUNT(s.id_solicitud)) * 100,
            2
        ) AS porcentaje_rechazo,
        
        -- Información adicional
        f.nombre AS facultad,
        
        -- Indicador de carga administrativa
        CASE
            WHEN COUNT(s.id_solicitud) > 50 THEN 'Alta'
            WHEN COUNT(s.id_solicitud) > 20 THEN 'Media'
            ELSE 'Baja'
        END AS carga_administrativa
        
    FROM tb_periodo_vacacional p
    
    -- LEFT JOIN porque puede haber periodos sin solicitudes
    LEFT JOIN tb_solicitud_permiso s 
        ON s.id_periodo_fk = p.id_periodo
    
    -- LEFT JOIN con facultad (puede ser NULL si es para toda la universidad)
    LEFT JOIN tb_facultad f 
        ON f.id_facultad = p.id_facultad_fk
    
    WHERE 1=1
        -- Filtro por periodo específico (si se proporciona)
        AND (p_id_periodo IS NULL OR p.id_periodo = p_id_periodo)
        
        -- Filtro por año (si se proporciona)
        AND (p_año IS NULL OR p.año = p_año)
    
    -- Agrupar por periodo
    GROUP BY p.id_periodo
    
    -- Ordenar por año y fecha de inicio
    ORDER BY p.año DESC, p.fecha_inicio_periodo DESC;
    
    /* =====================================================
       3. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'GENERAR_REPORTE',
        'tb_periodo_vacacional',
        NULL,
        CONCAT(
            'Admin generó reporte de solicitudes por periodo. Filtros: ',
            'Periodo=', IFNULL(p_id_periodo, 'Todos'), ', ',
            'Año=', IFNULL(p_anio, 'Todos')
        )
    );
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_admin_ver_auditoria`(
    IN p_id_admin INT,
    IN p_id_usuario_filtro INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_accion_filtro VARCHAR(100)
)
BEGIN
    /* =====================================================
       1. Validar que el ejecutor sea Admin activo
    ===================================================== */
    IF fn_es_admin_activo(p_id_admin) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado: se requieren privilegios de administrador';
    END IF;
    
    /* =====================================================
       2. Consultar registros de auditoría con filtros dinámicos
    ===================================================== */
    SELECT 
        -- Información del evento de auditoría
        a.id_auditoria,
        a.accion,
        a.tabla_afectada,
        a.id_registro_afectado,
        a.descripcion,
        a.fecha_evento,
        
        -- Información del usuario que realizó la acción
        a.id_usuario_fk,
        CONCAT(
            u.nombre, ' ',
            u.apellido_paterno, ' ',
            IFNULL(u.apellido_materno, '')
        ) AS usuario_nombre_completo,
        u.email AS usuario_email,
        r.nombre AS usuario_rol,
        
        -- Información adicional útil
        DATE_FORMAT(a.fecha_evento, '%d/%m/%Y %H:%i:%s') AS fecha_evento_formato,
        DATEDIFF(CURRENT_DATE, DATE(a.fecha_evento)) AS dias_desde_evento
        
    FROM tb_auditoria a
    
    -- JOIN con usuario para obtener información de quién hizo la acción
    INNER JOIN tb_usuario u 
        ON u.id_usuario = a.id_usuario_fk
    
    -- JOIN con rol para identificar el rol del usuario
    INNER JOIN tb_rol r 
        ON r.id_rol = u.id_rol
    
    WHERE 1=1
        -- Filtro por usuario (si se proporciona)
        AND (p_id_usuario_filtro IS NULL OR a.id_usuario_fk = p_id_usuario_filtro)
        
        -- Filtro por fecha inicio (si se proporciona)
        AND (p_fecha_inicio IS NULL OR DATE(a.fecha_evento) >= p_fecha_inicio)
        
        -- Filtro por fecha fin (si se proporciona)
        AND (p_fecha_fin IS NULL OR DATE(a.fecha_evento) <= p_fecha_fin)
        
        -- Filtro por tipo de acción (si se proporciona)
        AND (p_accion_filtro IS NULL OR a.accion LIKE CONCAT('%', p_accion_filtro, '%'))
    
    -- Ordenar por fecha descendente (más recientes primero)
    ORDER BY a.fecha_evento DESC;
    
    /* =====================================================
       3. Registrar que el admin consultó la auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_admin,
        'VER_AUDITORIA',
        'tb_auditoria',
        NULL,
        CONCAT(
            'Admin consultó auditoría. Filtros: ',
            'Usuario=', IFNULL(p_id_usuario_filtro, 'Todos'), ', ',
            'Fecha inicio=', IFNULL(p_fecha_inicio, 'Sin límite'), ', ',
            'Fecha fin=', IFNULL(p_fecha_fin, 'Sin límite'), ', ',
            'Acción=', IFNULL(p_accion_filtro, 'Todas')
        )
    );
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_auditoria_registrar_evento21`(
		in p_id_usuario int,
		in p_accion varchar(100),
		in p_tabla_afectada varchar(100),
		in p_id_registro_afectado int,
		in p_descripcion text
)
begin 
	insert into tb_auditoria (
		id_usuario_fk,
		accion,
		tabla_afectada,
		id_registro_afectado,
		descripcion,
		fecha_evento
	)
	values (
	p_id_usuario,
	p_accion,
	p_tabla_afectada,
	p_id_registro_afectado,
	p_descripcion,
	CURRENT_TIMESTAMP
	);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_inicializar_contexto_usuario`(
    IN p_id_usuario INT
)
BEGIN
    DECLARE v_id_usuario INT;
    DECLARE v_Nombre VARCHAR(100);
    DECLARE v_Rol VARCHAR(50);
    DECLARE v_Estado ENUM('Activo','Inactivo');
    DECLARE v_Agremiado ENUM('Sí', 'No');
    -- Buscar usuario
    SELECT 
        u.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', u.apellido_materno),
        r.nombre,
        u.estado
    INTO v_id_usuario, v_Nombre, v_Rol, v_Estado
    FROM tb_usuario u 
    INNER JOIN tb_rol r ON r.id_rol = u.id_rol
    WHERE u.id_usuario = p_id_usuario 
        AND u.estado = 'Activo' 
        AND r.estado = 'Activo'
    LIMIT 1;
    
    -- Si no existe o no está activo
    IF v_id_usuario IS NULL THEN
        SELECT 
            NULL AS id_usuario,
            'Su usuario se encuentra Inactivo, Bloqueado, Pendiente o Suspendido. Consulte con el administrador' AS msg;
     
    ELSE
        -- Verificar si es agremiado
        IF EXISTS(
            SELECT 1 
            FROM tb_agremiado a 
            WHERE a.id_usuario_fk = v_id_usuario 
                AND a.estado = 'Activo'
        ) THEN 
            SET v_Agremiado = 'Sí';
        ELSE 
            SET v_Agremiado = 'No';
        END IF;
        
        -- Actualizar último acceso
        UPDATE tb_usuario 
        SET ultimo_acceso = CURRENT_TIMESTAMP
        WHERE id_usuario = v_id_usuario;
        
        -- ✅ REGISTRAR ACCESO EXITOSO EN AUDITORÍA
        CALL procedure_auditoria_registrar_evento21(
            v_id_usuario,                           -- id usuario
            'INICIALIZAR_CONTEXTO',                 -- acción
            'tb_usuario',                            -- tabla afectada
            v_id_usuario,                            -- id del registro
            CONCAT('Usuario ', v_Nombre, ' con rol ', v_Rol, ' inicializó contexto correctamente')  -- descripción
        );
        
        -- Retornar información del usuario
        SELECT 
            v_id_usuario AS 'Id Usuario',
            v_Nombre AS 'Nombre completo',
            v_Rol AS 'Rol',
            v_Estado AS 'Estado del usuario',
            v_Agremiado AS 'Indicador de agremiado';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_login_usuario`(
    IN p_email VARCHAR(100),
    IN p_password_hash VARCHAR(255)
)
proc: BEGIN
    DECLARE v_id_usuario INT;
    DECLARE v_nombre_completo VARCHAR(300);
    DECLARE v_rol VARCHAR(50);
    DECLARE v_estado ENUM('Activo', 'Inactivo', 'Bloqueado', 'Pendiente', 'Suspendido');
    DECLARE v_password_hash_bd VARCHAR(255);
    DECLARE v_es_agremiado ENUM('Sí', 'No') DEFAULT 'No';
    
    /* =====================================================
       1. Buscar usuario por email
    ===================================================== */
    SELECT 
        u.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', IFNULL(u.apellido_materno, '')) AS nombre_completo,
        r.nombre AS rol,
        u.estado,
        u.password_hash
    INTO 
        v_id_usuario,
        v_nombre_completo,
        v_rol,
        v_estado,
        v_password_hash_bd
    FROM tb_usuario u
    INNER JOIN tb_rol r ON r.id_rol = u.id_rol
    WHERE u.email = p_email
        AND r.estado = 'Activo'  -- El rol también debe estar activo
    LIMIT 1;
    
    /* =====================================================
       2. Validar que el usuario exista
    ===================================================== */
    IF v_id_usuario IS NULL THEN
        -- Usuario no encontrado o rol inactivo
        SELECT 
            NULL AS id_usuario,
            NULL AS nombre_completo,
            NULL AS rol,
            NULL AS estado,
            NULL AS es_agremiado,
            'Credenciales incorrectas' AS mensaje,
            'ERROR' AS tipo_respuesta;
        
        -- Registrar intento fallido en auditoría
        -- Nota: No podemos llamar procedure_auditoria aquí porque no tenemos id_usuario
        LEAVE proc;
    END IF;
    
    /* =====================================================
       3. Verificar que la contraseña sea correcta
    ===================================================== */
    IF v_password_hash_bd != p_password_hash THEN
        -- Contraseña incorrecta
        SELECT 
            NULL AS id_usuario,
            NULL AS nombre_completo,
            NULL AS rol,
            NULL AS estado,
            NULL AS es_agremiado,
            'Credenciales incorrectas' AS mensaje,
            'ERROR' AS tipo_respuesta;
        
        -- Registrar intento fallido en auditoría
        CALL procedure_auditoria_registrar_evento21(
            v_id_usuario,
            'LOGIN_FALLIDO',
            'tb_usuario',
            v_id_usuario,
            CONCAT('Intento de login fallido - Email: ', p_email, ' - Contraseña incorrecta')
        );
        
        LEAVE proc;
    END IF;
    
    /* =====================================================
       4. Verificar que el estado sea Activo
    ===================================================== */
    IF v_estado != 'Activo' THEN
        -- Usuario no activo
        SELECT 
            NULL AS id_usuario,
            NULL AS nombre_completo,
            NULL AS rol,
            v_estado AS estado,
            NULL AS es_agremiado,
            CASE v_estado
                WHEN 'Inactivo' THEN 'Su cuenta está inactiva. Contacte al administrador'
                WHEN 'Bloqueado' THEN 'Su cuenta ha sido bloqueada. Contacte al administrador'
                WHEN 'Pendiente' THEN 'Su cuenta está pendiente de activación. Contacte al administrador'
                WHEN 'Suspendido' THEN 'Su cuenta ha sido suspendida. Contacte al administrador'
                ELSE 'Su cuenta no está disponible. Contacte al administrador'
            END AS mensaje,
            'CUENTA_NO_ACTIVA' AS tipo_respuesta;
        
        -- Registrar intento de acceso con cuenta no activa
        CALL procedure_auditoria_registrar_evento21(
            v_id_usuario,
            'LOGIN_RECHAZADO',
            'tb_usuario',
            v_id_usuario,
            CONCAT('Intento de login rechazado - Email: ', p_email, ' - Estado: ', v_estado)
        );
        
        LEAVE proc;
    END IF;
    
    /* =====================================================
       5. Verificar si es agremiado
    ===================================================== */
    IF EXISTS (
        SELECT 1 
        FROM tb_agremiado a
        WHERE a.id_usuario_fk = v_id_usuario
            AND a.estado = 'Activo'
    ) THEN
        SET v_es_agremiado = 'Sí';
    ELSE
        SET v_es_agremiado = 'No';
    END IF;
    
    /* =====================================================
       6. Actualizar último acceso
    ===================================================== */
    UPDATE tb_usuario
    SET ultimo_acceso = CURRENT_TIMESTAMP
    WHERE id_usuario = v_id_usuario;
    
    /* =====================================================
       7. Registrar login exitoso en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        v_id_usuario,
        'LOGIN_EXITOSO',
        'tb_usuario',
        v_id_usuario,
        CONCAT('Login exitoso - Email: ', p_email, ' - Rol: ', v_rol, ' - Es agremiado: ', v_es_agremiado)
    );
    
    /* =====================================================
       8. Devolver información del usuario autenticado
    ===================================================== */
    SELECT 
        v_id_usuario AS id_usuario,
        v_nombre_completo AS nombre_completo,
        v_rol AS rol,
        v_estado AS estado,
        v_es_agremiado AS es_agremiado,
        'Login exitoso' AS mensaje,
        'SUCCESS' AS tipo_respuesta,
        CURRENT_TIMESTAMP AS fecha_login;
    
END proc ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_actualizar_perfil`(
    IN p_id_usuario INT,
    IN p_email_institucional VARCHAR(100),
    IN p_departamento VARCHAR(100),
    IN p_puesto VARCHAR(100)
)
BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    DECLARE v_id_agremiado INT;
    DECLARE v_cambios_realizados TEXT DEFAULT '';
    
    /* =====================================================
       1. Validar que el usuario exista y esté activo
    ===================================================== */
    SELECT estado 
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo y no puede actualizar su perfil';
    END IF;
    
    /* =====================================================
       2. Validar que el usuario sea agremiado
          (solo agremiados tienen campos editables en tb_agremiado)
    ===================================================== */
    SELECT id_agremiado
    INTO v_id_agremiado
    FROM tb_agremiado
    WHERE id_usuario_fk = p_id_usuario
      AND estado = 'Activo';
    
    IF v_id_agremiado IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo usuarios agremiados activos pueden actualizar información de perfil';
    END IF;
    
    /* =====================================================
       3. Validar que al menos un campo tenga valor
    ===================================================== */
    IF p_email_institucional IS NULL 
       AND p_departamento IS NULL 
       AND p_puesto IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe especificar al menos un campo para actualizar';
    END IF;
    
    /* =====================================================
       4. Actualizar campos permitidos en tb_agremiado
          Solo actualiza los campos que no sean NULL
    ===================================================== */
    UPDATE tb_agremiado
    SET 
        email = IFNULL(p_email_institucional, email),
        departamento = IFNULL(p_departamento, departamento),
        puesto = IFNULL(p_puesto, puesto),
        fecha_actualizacion = CURRENT_TIMESTAMP
    WHERE id_agremiado = v_id_agremiado;
    
    /* =====================================================
       5. Construir mensaje de cambios realizados
    ===================================================== */
    IF p_email_institucional IS NOT NULL THEN
        SET v_cambios_realizados = CONCAT(v_cambios_realizados, 'Email institucional actualizado. ');
    END IF;
    
    IF p_departamento IS NOT NULL THEN
        SET v_cambios_realizados = CONCAT(v_cambios_realizados, 'Departamento actualizado. ');
    END IF;
    
    IF p_puesto IS NOT NULL THEN
        SET v_cambios_realizados = CONCAT(v_cambios_realizados, 'Puesto actualizado. ');
    END IF;
    
    /* =====================================================
       6. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario,
        'ACTUALIZAR_PERFIL',
        'tb_agremiado',
        v_id_agremiado,
        CONCAT('Usuario actualizó su perfil. Cambios: ', v_cambios_realizados)
    );
    
    /* =====================================================
       7. Retornar información actualizada
    ===================================================== */
    SELECT 
        a.id_agremiado,
        a.id_usuario_fk AS id_usuario,
        a.email AS email_institucional,
        a.departamento,
        a.puesto,
        a.fecha_actualizacion,
        v_cambios_realizados AS cambios_realizados,
        'Perfil actualizado correctamente' AS mensaje
    FROM tb_agremiado a
    WHERE a.id_agremiado = v_id_agremiado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_cambiar_password`(
    IN p_id_usuario INT,
    IN p_password_actual_hash VARCHAR(255),
    IN p_password_nueva_hash VARCHAR(255)
)
BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    DECLARE v_password_hash_actual VARCHAR(255);
    
    /* =====================================================
       1. Validar que el usuario exista
    ===================================================== */
    SELECT estado, password_hash
    INTO v_estado_usuario, v_password_hash_actual
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo y no puede cambiar su contraseña';
    END IF;
    
    /* =====================================================
       2. Validar que los parámetros no estén vacíos
    ===================================================== */
    IF p_password_actual_hash IS NULL OR TRIM(p_password_actual_hash) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La contraseña actual es obligatoria';
    END IF;
    
    IF p_password_nueva_hash IS NULL OR TRIM(p_password_nueva_hash) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La nueva contraseña es obligatoria';
    END IF;
    
    /* =====================================================
       3. Validar que la contraseña actual sea correcta
    ===================================================== */
    IF v_password_hash_actual <> p_password_actual_hash THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La contraseña actual es incorrecta';
    END IF;
    
    /* =====================================================
       4. Validar que la nueva contraseña sea diferente
    ===================================================== */
    IF p_password_nueva_hash = v_password_hash_actual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La nueva contraseña debe ser diferente a la actual';
    END IF;
    
    /* =====================================================
       5. Actualizar la contraseña
    ===================================================== */
    UPDATE tb_usuario
    SET 
        password_hash = p_password_nueva_hash,
        ultimo_acceso = CURRENT_TIMESTAMP
    WHERE id_usuario = p_id_usuario;
    
    /* =====================================================
       6. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario,
        'CAMBIAR_PASSWORD',
        'tb_usuario',
        p_id_usuario,
        'Usuario cambió su contraseña correctamente'
    );
    
    /* =====================================================
       7. Retornar confirmación
    ===================================================== */
    SELECT 
        p_id_usuario AS id_usuario,
        CURRENT_TIMESTAMP AS fecha_cambio,
        'Contraseña actualizada correctamente' AS mensaje,
        'Por seguridad, se recomienda cerrar sesión y volver a iniciar sesión con la nueva contraseña' AS recomendacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_usuario_cancelar_solicitud`(
    IN p_id_usuario INT,
    IN p_id_solicitud INT
)
BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    DECLARE v_estado_solicitud ENUM('Pendiente','Aprobado','Rechazado','Cancelado');
    DECLARE v_id_usuario_solicitud INT;
    DECLARE v_tipo_permiso ENUM('Vacaciones','Economico','Personal','Medico');
    DECLARE v_fecha_inicio DATE;
    DECLARE v_fecha_fin DATE;
    DECLARE v_dias_solicitados INT;
    declare v_mensaje_error varchar(255);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
   
    /* =====================================================
       1. Validar que el usuario exista y esté activo
    ===================================================== */
    SELECT estado 
    INTO v_estado_usuario 
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo y no puede cancelar solicitudes';
    END IF;
    
    /* =====================================================
       2. Validar que el usuario sea agremiado activo
          (Consistente con procedure_usuario_crear_solicitud)
    ===================================================== */
    IF NOT EXISTS (
        SELECT 1 
        FROM tb_agremiado 
        WHERE id_usuario_fk = p_id_usuario 
          AND estado = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo agremiados activos pueden cancelar solicitudes de permiso';
    END IF;
    
    /* =====================================================
       3. Obtener información de la solicitud con lock
    ===================================================== */
    SELECT 
        id_usuario_fk, 
        estado,
        tipo_permiso,
        fecha_inicio,
        fecha_fin,
        dias_solicitados
    INTO 
        v_id_usuario_solicitud, 
        v_estado_solicitud,
        v_tipo_permiso,
        v_fecha_inicio,
        v_fecha_fin,
        v_dias_solicitados
    FROM tb_solicitud_permiso
    WHERE id_solicitud = p_id_solicitud
    FOR UPDATE;  -- Lock pesimista para evitar race conditions
    
    /* Validar que la solicitud exista */
    IF v_estado_solicitud IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La solicitud no existe';
    END IF;
    
    /* Validar que la solicitud pertenezca al usuario */
    IF v_id_usuario_solicitud <> p_id_usuario THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La solicitud no pertenece al usuario. Acción no autorizada.';
    END IF;
    
    /* =====================================================
       4. Verificar que el estado sea Pendiente
    ===================================================== */
    IF v_estado_solicitud <> 'Pendiente' THEN
     set v_mensaje_error= CONCAT(
            'Solo se pueden cancelar solicitudes pendientes. Estado actual: ',
            v_estado_solicitud
        );
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensaje_error;
    END IF;
    
    /* =====================================================
       5. Actualizar a estado Cancelado
          Nota: fecha_actualizacion se actualiza automáticamente
    ===================================================== */
    UPDATE tb_solicitud_permiso 
    SET estado = 'Cancelado'
        -- fecha_actualizacion se actualiza sola (ON UPDATE CURRENT_TIMESTAMP)
    WHERE id_solicitud = p_id_solicitud;
    
    /* =====================================================
       6. Registrar en auditoría con detalles completos
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario,
        'CANCELAR_SOLICITUD',
        'tb_solicitud_permiso',
        p_id_solicitud,
        CONCAT(
            'Usuario canceló solicitud. Tipo: ', v_tipo_permiso,
            ', Días: ', v_dias_solicitados,
            ', Periodo: ', v_fecha_inicio, ' al ', v_fecha_fin
        )
    );
    
    /* =====================================================
       7. Crear notificación de confirmación
    ===================================================== */
    CALL _internal_crear_notificacion(
        p_id_usuario,
        p_id_solicitud,
        'Solicitud Cancelada',
        CONCAT(
            'Ha cancelado correctamente su solicitud de ', v_tipo_permiso,
            ' del ', v_fecha_inicio, ' al ', v_fecha_fin
        ),
        'Sistema',
        'Solicitud'
    );
    
    COMMIT;
    
    /* =====================================================
       8. Respuesta con información completa
    ===================================================== */
    SELECT 
        p_id_solicitud AS id_solicitud,
        'Cancelado' AS estado,
        v_tipo_permiso AS tipo_permiso,
        v_fecha_inicio AS fecha_inicio,
        v_fecha_fin AS fecha_fin,
        v_dias_solicitados AS dias_solicitados,
        CURRENT_TIMESTAMP AS fecha_cancelacion,
        'Solicitud cancelada correctamente. Se ha generado una confirmación.' AS mensaje;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_cerrar_sesion`(
    IN p_id_usuario INT
)
proc:BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
 
    -- 1. Validar que id_usuario exista y esté activo
    SELECT estado
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo';
    END IF;

    -- 4. Registrar fecha y hora de cierre usando la columna existente "ultimo_acceso"
    UPDATE tb_usuario
    SET ultimo_acceso = CURRENT_TIMESTAMP  -- ✅ Usa columna existente
    WHERE id_usuario = p_id_usuario;
 
    -- 5. Insertar un registro en tb_auditoria indicando acción "Cerrar sesión"
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario,
        'LOGOUT',
        'tb_usuario',
        p_id_usuario,
        'Cierre de sesión del usuario'
    );
    COMMIT;
    -- 6. Confirmar operación
    SELECT
        p_id_usuario AS id_usuario,
        CURRENT_TIMESTAMP AS fecha_cierre,
        'Sesión cerrada correctamente' AS mensaje;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `procedure_usuario_crear_solicitud`(
    IN p_id_usuario INT,
    IN p_id_periodo INT,
    IN p_tipo_permiso ENUM('Vacaciones','Economico','Personal','Medico'),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_motivo TEXT
)
BEGIN
    /* =======================
       Declaración de variables
    ======================= */
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    DECLARE v_dias_solicitados INT;
    DECLARE v_max_dias INT;
    DECLARE v_anio INT;
    DECLARE v_dias_no_habiles INT DEFAULT 0;
    DECLARE v_dias_disponibles INT;
    DECLARE v_id_solicitud INT;
    DECLARE v_id_facultad INT;
    DECLARE v_mensaje_error TEXT;

    /* =======================
       Handler de errores
    ======================= */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    /* =====================================================
       1. Validar que el usuario exista y esté activo
    ===================================================== */
    SELECT estado
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;

    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;

    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo y no puede solicitar permisos';
    END IF;

    /* =====================================================
       2. Validar que el usuario sea agremiado activo
    ===================================================== */
    IF NOT EXISTS (
        SELECT 1
        FROM tb_agremiado
        WHERE id_usuario_fk = p_id_usuario
          AND estado = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo agremiados activos pueden crear solicitudes de permiso';
    END IF;

    SELECT id_facultad_fk
    INTO v_id_facultad
    FROM tb_agremiado
    WHERE id_usuario_fk = p_id_usuario;

    /* =====================================================
       3. Validar periodo si aplica
    ===================================================== */
    IF p_id_periodo IS NOT NULL THEN
        IF NOT EXISTS (
            SELECT 1
            FROM tb_periodo_vacacional
            WHERE id_periodo = p_id_periodo
              AND estado = 'Activo'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El periodo vacacional no está activo o no existe';
        END IF;
    END IF;

    /* =====================================================
       4. Calcular días solicitados
    ===================================================== */
    SET v_dias_solicitados = DATEDIFF(p_fecha_fin, p_fecha_inicio) + 1;

    IF v_dias_solicitados <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Las fechas de la solicitud no son válidas';
    END IF;

    /* =====================================================
       5. Consultar reglas (Facultad → Universidad)
    ===================================================== */
    SET v_anio = YEAR(p_fecha_inicio);

    SELECT max_permisos_dia
    INTO v_max_dias
    FROM tb_reglas_permisos
    WHERE tipo_permiso = p_tipo_permiso
      AND anio = v_anio
      AND estado = 'Activa'
      AND aplica = 'Facultad'
      AND id_facultad_fk = v_id_facultad
    LIMIT 1;

    IF v_max_dias IS NULL THEN
        SELECT max_permisos_dia
        INTO v_max_dias
        FROM tb_reglas_permisos
        WHERE tipo_permiso = p_tipo_permiso
          AND anio = v_anio
          AND estado = 'Activa'
          AND aplica = 'Universidad'
        LIMIT 1;
    END IF;

    IF v_max_dias IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existen reglas activas para el tipo de permiso solicitado';
    END IF;

    IF v_dias_solicitados > v_max_dias THEN
        SET v_mensaje_error = CONCAT(
            'Los días solicitados (', v_dias_solicitados,
            ') exceden el máximo permitido (', v_max_dias, ')'
        );
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensaje_error;
    END IF;

    /* =====================================================
       6. Validar días no hábiles
    ===================================================== */
    SELECT COUNT(*)
    INTO v_dias_no_habiles
    FROM tb_dias_no_habiles
    WHERE fecha BETWEEN p_fecha_inicio AND p_fecha_fin
      AND estado = 'Activo';

    IF v_dias_no_habiles > 0 THEN
        SET v_mensaje_error = CONCAT(
            'La solicitud contiene ', v_dias_no_habiles,
            ' día(s) no hábil(es). Ajuste las fechas.'
        );
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensaje_error;
    END IF;

    /* =====================================================
       7. Validar días disponibles (Vacaciones)
    ===================================================== */
    IF p_tipo_permiso = 'Vacaciones' THEN
        SELECT dias_disponibles
        INTO v_dias_disponibles
        FROM vw_dias_disponibles
        WHERE id_usuario_fk = p_id_usuario;

        IF v_dias_disponibles IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se pudo determinar los días disponibles';
        END IF;

        IF v_dias_solicitados > v_dias_disponibles THEN
            SET v_mensaje_error = CONCAT(
                'No tiene suficientes días disponibles. ',
                'Solicitados: ', v_dias_solicitados,
                ', Disponibles: ', v_dias_disponibles
            );
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = v_mensaje_error;
        END IF;
    END IF;

    /* =====================================================
       8. Validar traslape de solicitudes
    ===================================================== */
    IF EXISTS (
        SELECT 1
        FROM tb_solicitud_permiso
        WHERE id_usuario_fk = p_id_usuario
          AND estado IN ('Pendiente','Aprobado')
          AND p_fecha_inicio <= fecha_fin
          AND p_fecha_fin >= fecha_inicio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe una solicitud que se traslapa con estas fechas';
    END IF;

    /* =====================================================
       9. Insertar solicitud
    ===================================================== */
    INSERT INTO tb_solicitud_permiso (
        id_usuario_fk,
        id_periodo_fk,
        tipo_permiso,
        fecha_inicio,
        fecha_fin,
        dias_solicitados,
        motivo,
        estado,
        fecha_solicitud
    ) VALUES (
        p_id_usuario,
        p_id_periodo,
        p_tipo_permiso,
        p_fecha_inicio,
        p_fecha_fin,
        v_dias_solicitados,
        p_motivo,
        'Pendiente',
        CURRENT_TIMESTAMP
    );

    SET v_id_solicitud = LAST_INSERT_ID();

    /* =====================================================
       10. Auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario,
        'INSERT',
        'tb_solicitud_permiso',
        v_id_solicitud,
        CONCAT(
            'Solicitud de ', p_tipo_permiso,
            ' creada. Días: ', v_dias_solicitados,
            '. Periodo: ', p_fecha_inicio, ' a ', p_fecha_fin
        )
    );

    COMMIT;

    /* =====================================================
       11. Respuesta
    ===================================================== */
    SELECT
        v_id_solicitud AS id_solicitud,
        'Pendiente' AS estado,
        p_tipo_permiso AS tipo_permiso,
        p_fecha_inicio AS fecha_inicio,
        p_fecha_fin AS fecha_fin,
        v_dias_solicitados AS dias_solicitados,
        'Solicitud registrada correctamente. Pendiente de aprobación.' AS mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_marcar_notificacion_leida`(
    IN p_id_usuario INT,
    IN p_id_notificacion INT
)
proc:BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    DECLARE v_id_usuario_notificacion INT;
    DECLARE v_leida BOOLEAN;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    -- 1. Validar que el usuario exista y esté activo
    SELECT estado
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo';
    END IF;
    
    -- 2. Verificar que id_notificacion exista y pertenezca a id_usuario
    SELECT id_usuario_fk, leida
    INTO v_id_usuario_notificacion, v_leida
    FROM tb_notificacion
    WHERE id_notificacion = p_id_notificacion
    FOR UPDATE;
    
    IF v_id_usuario_notificacion IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La notificación no existe';
    END IF;
    
    IF v_id_usuario_notificacion <> p_id_usuario THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La notificación no pertenece al usuario';
    END IF;
    
    -- (Opcional pero elegante) Evitar marcar dos veces
    IF v_leida = TRUE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La notificación ya fue marcada como leída';
    END IF;

    -- 3. Actualizar leida = TRUE y fecha_leida = CURRENT_TIMESTAMP
    UPDATE tb_notificacion
    SET leida = TRUE,
        fecha_leida = CURRENT_TIMESTAMP
    WHERE id_notificacion = p_id_notificacion;
    
    COMMIT;
    
    -- 4. Retornar confirmación
    SELECT
        p_id_notificacion AS id_notificacion,
        TRUE AS leida,
        CURRENT_TIMESTAMP AS fecha_leida,
        'Notificación marcada como leída correctamente' AS mensaje;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_ver_mis_solicitudes`(
    IN p_id_usuario INT
)
BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    
    /* =====================================================
       1. Validar que el usuario exista
    ===================================================== */
    SELECT estado 
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    /* Permitir consulta incluso si el usuario no está activo
       (puede querer ver su historial) */
    /* =====================================================
       2. Consultar todas las solicitudes del usuario
    ===================================================== */
    SELECT 
        -- Información de la solicitud
        s.id_solicitud,
        s.tipo_permiso,
        s.fecha_inicio,
        s.fecha_fin,
        s.dias_solicitados,
        s.estado,
        s.motivo,
        s.motivo_rechazado,
        s.comentarios_aprobador,
        s.fecha_solicitud,
        s.fecha_actualizacion,
        s.fecha_aprobacion,
        
        -- Información del periodo (si aplica)
        p.id_periodo,
        p.nombre_periodo,
        p.tipo_periodo,
        p.anio AS año_periodo,
        p.fecha_inicio_periodo,
        p.fecha_fin_periodo,
        
        -- Indicadores útiles
        CASE 
            WHEN s.estado = 'Aprobado' 
                 AND CURRENT_DATE BETWEEN s.fecha_inicio AND s.fecha_fin 
            THEN 'Si'
            ELSE 'No'
        END AS en_curso,
        
        CASE 
            WHEN s.estado = 'Aprobado' AND CURRENT_DATE > s.fecha_fin 
            THEN 'Si'
            ELSE 'No'
        END AS finalizado,
        
        CASE 
            WHEN s.estado = 'Aprobado' 
                 AND DATEDIFF(s.fecha_inicio, CURRENT_DATE) BETWEEN 0 AND 7 
            THEN 'Si'
            ELSE 'No'
        END AS proximo_a_iniciar,
        
        DATEDIFF(CURRENT_DATE, s.fecha_solicitud) AS dias_desde_solicitud
        
    FROM tb_solicitud_permiso s
    
    -- LEFT JOIN porque no todas las solicitudes tienen periodo
    LEFT JOIN tb_periodo_vacacional p
        ON p.id_periodo = s.id_periodo_fk
    
    WHERE s.id_usuario_fk = p_id_usuario
    
    -- Ordenar por fecha de solicitud (más recientes primero)
    ORDER BY s.fecha_solicitud DESC;
    
    /* =====================================================
       3. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario,
        'VER_MIS_SOLICITUDES',
        'tb_solicitud_permiso',
        p_id_usuario,
        'Usuario consultó su historial de solicitudes'
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_ver_notificaciones`(
    IN p_id_usuario INT
)
proc:BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;

    -- 1. Validar que id_usuario exista y esté activo
    SELECT estado
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo';
    END IF;

    -- 2. Consultar tb_notificacion filtrando por id_usuario_fk = id_usuario
    -- 3. Recuperar campos
    -- 4. Ordenar el resultado por fecha_envio descendente
    -- 5. Retornar el listado al usuario
    SELECT 
        n.id_notificacion, 
        n.titulo, 
        n.mensaje, 
        n.tipo, 
        n.leida, 
        n.fecha_envio,
        n.categoria
    FROM tb_notificacion n
    WHERE n.id_usuario_fk = p_id_usuario
    ORDER BY n.fecha_envio DESC;
    
    COMMIT;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_ver_perfil`(
    IN p_id_usuario INT
)
BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    
    /* =====================================================
       1. Validar que el usuario exista
    ===================================================== */
    SELECT estado 
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo';
    END IF;
    
    /* =====================================================
       2. Consultar información completa del perfil
          Usando LEFT JOIN porque el usuario puede no ser agremiado
    ===================================================== */
    SELECT 
        -- Información personal del usuario
        u.id_usuario,
        u.email,
        u.nombre,
        u.apellido_paterno,
        u.apellido_materno,
        CONCAT(u.nombre, ' ', u.apellido_paterno, ' ', IFNULL(u.apellido_materno, '')) AS nombre_completo,
        
        -- Rol del usuario
        r.id_rol,
        r.nombre AS rol,
        r.descripcion AS descripcion_rol,
        
        -- Estado y fechas del usuario
        u.estado AS estado_usuario,
        u.fecha_creacion,
        u.ultimo_acceso,
        
        -- Indicador de agremiado
        CASE 
            WHEN a.id_agremiado IS NOT NULL THEN 'Sí'
            ELSE 'No'
        END AS es_agremiado,
        
        -- Información de agremiado (si aplica)
        a.id_agremiado,
        a.matricula,
        a.tipo_contrato,
        a.tipo_jornada,
        a.fecha_ingreso,
        a.anios_antiguedad,
        a.departamento,
        a.puesto,
        a.email AS email_institucional,
        a.estado AS estado_agremiado,
        a.fecha_creacion AS fecha_agremiacion,
        
        -- Información de facultad (si aplica)
        f.id_facultad,
        f.nombre AS facultad,
        f.direccion AS direccion_facultad,
        f.email AS email_facultad,
        f.telefono AS telefono_facultad,
        f.estado AS estado_facultad
        
    FROM tb_usuario u
    
    -- JOIN obligatorio con rol
    INNER JOIN tb_rol r 
        ON r.id_rol = u.id_rol
    
    -- LEFT JOIN porque puede no ser agremiado
    LEFT JOIN tb_agremiado a 
        ON a.id_usuario_fk = u.id_usuario
    
    -- LEFT JOIN porque depende de si es agremiado
    LEFT JOIN tb_facultad f 
        ON f.id_facultad = a.id_facultad_fk
    
    WHERE u.id_usuario = p_id_usuario;
    
    /* =====================================================
       3. Registrar en auditoría
    ===================================================== */
    CALL procedure_auditoria_registrar_evento21(
        p_id_usuario,
        'VER_PERFIL',
        'tb_usuario',
        p_id_usuario,
        'Usuario consultó su perfil'
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jhonatan`@`%` PROCEDURE `procedure_usuario_ver_reglas`(
    IN p_id_usuario INT
)
proc:BEGIN
    DECLARE v_estado_usuario ENUM('Activo','Inactivo','Bloqueado','Pendiente','Suspendido');
    DECLARE v_id_facultad INT;
 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        RESIGNAL;
    END;

    -- 1. Validar que id_usuario exista y esté activo
    SELECT estado
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario;
    
    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no está activo';
    END IF;
 
    -- 2. Determinar si el usuario es agremiado y obtener su facultad
    SELECT a.id_facultad_fk
    INTO v_id_facultad
    FROM tb_agremiado a
    WHERE a.id_usuario_fk = p_id_usuario
    LIMIT 1;

    -- 3. Consultar tb_reglas_permisos
    -- 4. Recuperar campos
    -- 5. Retornar los registros ordenados
    SELECT
        r.id_regla,
        r.anio,  -- ✅ AGREGADO: Este campo existe en tu tabla y es importante
        r.tipo_permiso,
        r.max_permisos_dia,
        r.aplica,
        r.id_facultad_fk,
        f.nombre AS nombre_facultad  -- ✅ CORREGIDO: era "nombre_facultad", debe ser "nombre"
    FROM tb_reglas_permisos r
    LEFT JOIN tb_facultad f
        ON r.id_facultad_fk = f.id_facultad
    WHERE r.estado = 'Activa'
      AND (
            r.aplica = 'Universidad'
            OR (r.aplica = 'Facultad' AND r.id_facultad_fk = v_id_facultad)
          )
    ORDER BY
        r.tipo_permiso,
        CASE r.aplica
            WHEN 'Facultad' THEN 1
            WHEN 'Universidad' THEN 2
        END;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 5.5.5-10.11.11-MariaDB-0+deb12u1.
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jose`@`%` PROCEDURE `_internal_crear_notificacion`(
    IN p_id_usuario_destino INT,
    IN p_id_solicitud INT,
    IN p_titulo VARCHAR(150),
    IN p_mensaje TEXT,
    IN p_tipo ENUM(
        'Aprobación',
        'Rechazo',
        'Recordatorio',
        'Vencimiento',
        'Nueva Solicitud',
        'Sistema'
    ),
    IN p_categoria ENUM(
        'Solicitud',
        'Alerta',
        'Información'
    )
)
BEGIN
    DECLARE v_estado_usuario VARCHAR(20);

    -- 1. Validar existencia del usuario
    SELECT estado
    INTO v_estado_usuario
    FROM tb_usuario
    WHERE id_usuario = p_id_usuario_destino;

    IF v_estado_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario destinatario no existe';
    END IF;

    -- 2. Validar usuario activo
    IF v_estado_usuario <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario destinatario no se encuentra activo';
    END IF;

    -- 3. Insertar notificación
    INSERT INTO tb_notificacion (
        id_usuario_fk,
        id_solicitud_fk,
        titulo,
        mensaje,
        tipo,
        categoria,
        leida,
        fecha_envio
    ) VALUES (
        p_id_usuario_destino,
        p_id_solicitud,
        p_titulo,
        p_mensaje,
        p_tipo,
        p_categoria,
        FALSE,
        CURRENT_TIMESTAMP
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-02  0:10:19
