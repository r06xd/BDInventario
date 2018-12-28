/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     28/12/2018 14:40:13                          */
/*==============================================================*/


drop index AREA_PK;

drop table AREA;

drop index BIEN_PK;

drop table BIEN;

drop index DETALLEBIEN_FK;

drop index DETALLEENTRADA_FK;

drop index DETALLEPROVEEDOR_FK;

drop index DETALLEENTRADA_PK;

drop table DETALLEENTRADA;

drop index DETALLEORDENBIEN_FK;

drop index DETALLEORDEN_FK;

drop index DETALLEORDEN_PK;

drop table DETALLEORDEN;

drop index DETALLEEMPLEADOSALIDA_FK;

drop index DETALLESALIDA_FK;

drop index DETALEBIENSALIDA_FK;

drop index DETALLESALIDA_PK;

drop table DETALLESALIDA;

drop index ITEMDETALLE_FK;

drop index DETALLEITEM_FK;

drop index DETALLESOLICITUD_PK;

drop table DETALLESOLICITUD;

drop index AREAEMPLEADO_FK;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index ENTRADAALMACEN_PK;

drop table ENTRADAALMACEN;

drop index ORDENPROVEEDOR_FK;

drop index ORDENPEDIDO_PK;

drop table ORDENPEDIDO;

drop index PROVEEDOR_PK;

drop table PROVEEDOR;

drop index SALIDAALMACEN_PK;

drop table SALIDAALMACEN;

drop index AREASOLICITUD_FK;

drop index SOLICITUD_PK;

drop table SOLICITUD;

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
create table AREA (
   CODI_AREA            INT4                 not null,
   NOMB_AREA            VARCHAR(25)          null,
   constraint PK_AREA primary key (CODI_AREA)
);

/*==============================================================*/
/* Index: AREA_PK                                               */
/*==============================================================*/
create unique index AREA_PK on AREA (
CODI_AREA
);

/*==============================================================*/
/* Table: BIEN                                                  */
/*==============================================================*/
create table BIEN (
   CODI_ITEM            INT4                 not null,
   NOMB_ITEM            VARCHAR(50)          null,
   constraint PK_BIEN primary key (CODI_ITEM)
);

/*==============================================================*/
/* Index: BIEN_PK                                               */
/*==============================================================*/
create unique index BIEN_PK on BIEN (
CODI_ITEM
);

/*==============================================================*/
/* Table: DETALLEENTRADA                                        */
/*==============================================================*/
create table DETALLEENTRADA (
   VALOR_UNIT           DECIMAL              null,
   VALOR_TOTAL          DECIMAL              null,
   CODI_ENTRA           INT4                 not null,
   CEDU_PROVE           INT4                 null,
   NUME_ENTRA           INT4                 null,
   CODI_ITEM            INT4                 null,
   constraint PK_DETALLEENTRADA primary key (CODI_ENTRA)
);

/*==============================================================*/
/* Index: DETALLEENTRADA_PK                                     */
/*==============================================================*/
create unique index DETALLEENTRADA_PK on DETALLEENTRADA (
CODI_ENTRA
);

/*==============================================================*/
/* Index: DETALLEPROVEEDOR_FK                                   */
/*==============================================================*/
create  index DETALLEPROVEEDOR_FK on DETALLEENTRADA (
CEDU_PROVE
);

/*==============================================================*/
/* Index: DETALLEENTRADA_FK                                     */
/*==============================================================*/
create  index DETALLEENTRADA_FK on DETALLEENTRADA (
NUME_ENTRA
);

/*==============================================================*/
/* Index: DETALLEBIEN_FK                                        */
/*==============================================================*/
create  index DETALLEBIEN_FK on DETALLEENTRADA (
CODI_ITEM
);

/*==============================================================*/
/* Table: DETALLEORDEN                                          */
/*==============================================================*/
create table DETALLEORDEN (
   FECHA_ORDEN          DATE                 null,
   MONTO_ORDEN          DECIMAL              null,
   FECHA_ENTREGA        DATE                 null,
   CODI_ORDEN           INT4                 not null,
   NUME_ORDEN           INT4                 null,
   CODI_ITEM            INT4                 null,
   constraint PK_DETALLEORDEN primary key (CODI_ORDEN)
);

/*==============================================================*/
/* Index: DETALLEORDEN_PK                                       */
/*==============================================================*/
create unique index DETALLEORDEN_PK on DETALLEORDEN (
CODI_ORDEN
);

/*==============================================================*/
/* Index: DETALLEORDEN_FK                                       */
/*==============================================================*/
create  index DETALLEORDEN_FK on DETALLEORDEN (
NUME_ORDEN
);

/*==============================================================*/
/* Index: DETALLEORDENBIEN_FK                                   */
/*==============================================================*/
create  index DETALLEORDENBIEN_FK on DETALLEORDEN (
CODI_ITEM
);

/*==============================================================*/
/* Table: DETALLESALIDA                                         */
/*==============================================================*/
create table DETALLESALIDA (
   FECHA_ENTREG         DATE                 null,
   CODI_SALI            INT4                 not null,
   CODI_ITEM            INT4                 null,
   NUME_SALI            INT4                 null,
   CEDU_EMPLE           INT4                 null,
   constraint PK_DETALLESALIDA primary key (CODI_SALI)
);

/*==============================================================*/
/* Index: DETALLESALIDA_PK                                      */
/*==============================================================*/
create unique index DETALLESALIDA_PK on DETALLESALIDA (
CODI_SALI
);

/*==============================================================*/
/* Index: DETALEBIENSALIDA_FK                                   */
/*==============================================================*/
create  index DETALEBIENSALIDA_FK on DETALLESALIDA (
CODI_ITEM
);

/*==============================================================*/
/* Index: DETALLESALIDA_FK                                      */
/*==============================================================*/
create  index DETALLESALIDA_FK on DETALLESALIDA (
NUME_SALI
);

/*==============================================================*/
/* Index: DETALLEEMPLEADOSALIDA_FK                              */
/*==============================================================*/
create  index DETALLEEMPLEADOSALIDA_FK on DETALLESALIDA (
CEDU_EMPLE
);

/*==============================================================*/
/* Table: DETALLESOLICITUD                                      */
/*==============================================================*/
create table DETALLESOLICITUD (
   CANT_ITEM            INT4                 null,
   VALOR_UNIT           DECIMAL              null,
   VALOR_TOTAL          DECIMAL              null,
   CODI_SOLI            INT4                 not null,
   NUME_SOLI            INT4                 null,
   CODI_ITEM            INT4                 null,
   constraint PK_DETALLESOLICITUD primary key (CODI_SOLI)
);

/*==============================================================*/
/* Index: DETALLESOLICITUD_PK                                   */
/*==============================================================*/
create unique index DETALLESOLICITUD_PK on DETALLESOLICITUD (
CODI_SOLI
);

/*==============================================================*/
/* Index: DETALLEITEM_FK                                        */
/*==============================================================*/
create  index DETALLEITEM_FK on DETALLESOLICITUD (
NUME_SOLI
);

/*==============================================================*/
/* Index: ITEMDETALLE_FK                                        */
/*==============================================================*/
create  index ITEMDETALLE_FK on DETALLESOLICITUD (
CODI_ITEM
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CEDU_EMPLE           INT4                 not null,
   CODI_AREA            INT4                 null,
   NOMB_EMPLE           VARCHAR(50)          null,
   SPELL_EMPLE          VARCHAR(50)          null,
   constraint PK_EMPLEADO primary key (CEDU_EMPLE)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
CEDU_EMPLE
);

/*==============================================================*/
/* Index: AREAEMPLEADO_FK                                       */
/*==============================================================*/
create  index AREAEMPLEADO_FK on EMPLEADO (
CODI_AREA
);

/*==============================================================*/
/* Table: ENTRADAALMACEN                                        */
/*==============================================================*/
create table ENTRADAALMACEN (
   NUME_ENTRA           INT4                 not null,
   FECHA_ENTRA          DATE                 null,
   NUME_FACTU           INT4                 null,
   constraint PK_ENTRADAALMACEN primary key (NUME_ENTRA)
);

/*==============================================================*/
/* Index: ENTRADAALMACEN_PK                                     */
/*==============================================================*/
create unique index ENTRADAALMACEN_PK on ENTRADAALMACEN (
NUME_ENTRA
);

/*==============================================================*/
/* Table: ORDENPEDIDO                                           */
/*==============================================================*/
create table ORDENPEDIDO (
   NUME_ORDEN           INT4                 not null,
   CEDU_PROVE           INT4                 null,
   constraint PK_ORDENPEDIDO primary key (NUME_ORDEN)
);

/*==============================================================*/
/* Index: ORDENPEDIDO_PK                                        */
/*==============================================================*/
create unique index ORDENPEDIDO_PK on ORDENPEDIDO (
NUME_ORDEN
);

/*==============================================================*/
/* Index: ORDENPROVEEDOR_FK                                     */
/*==============================================================*/
create  index ORDENPROVEEDOR_FK on ORDENPEDIDO (
CEDU_PROVE
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   CEDU_PROVE           INT4                 not null,
   NOMB_PROVE           VARCHAR(50)          null,
   APELL_PROVE          VARCHAR(50)          null,
   EMPRE_PROVE          VARCHAR(80)          null,
   constraint PK_PROVEEDOR primary key (CEDU_PROVE)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
CEDU_PROVE
);

/*==============================================================*/
/* Table: SALIDAALMACEN                                         */
/*==============================================================*/
create table SALIDAALMACEN (
   NUME_SALI            INT4                 not null,
   FECHA_SALI           DATE                 null,
   constraint PK_SALIDAALMACEN primary key (NUME_SALI)
);

/*==============================================================*/
/* Index: SALIDAALMACEN_PK                                      */
/*==============================================================*/
create unique index SALIDAALMACEN_PK on SALIDAALMACEN (
NUME_SALI
);

/*==============================================================*/
/* Table: SOLICITUD                                             */
/*==============================================================*/
create table SOLICITUD (
   NUME_SOLI            INT4                 not null,
   CODI_AREA            INT4                 null,
   FECH_SOLI            DATE                 null,
   constraint PK_SOLICITUD primary key (NUME_SOLI)
);

/*==============================================================*/
/* Index: SOLICITUD_PK                                          */
/*==============================================================*/
create unique index SOLICITUD_PK on SOLICITUD (
NUME_SOLI
);

/*==============================================================*/
/* Index: AREASOLICITUD_FK                                      */
/*==============================================================*/
create  index AREASOLICITUD_FK on SOLICITUD (
CODI_AREA
);

alter table DETALLEENTRADA
   add constraint FK_DETALLEE_DETALLEBI_BIEN foreign key (CODI_ITEM)
      references BIEN (CODI_ITEM)
      on delete restrict on update restrict;

alter table DETALLEENTRADA
   add constraint FK_DETALLEE_DETALLEEN_ENTRADAA foreign key (NUME_ENTRA)
      references ENTRADAALMACEN (NUME_ENTRA)
      on delete restrict on update restrict;

alter table DETALLEENTRADA
   add constraint FK_DETALLEE_DETALLEPR_PROVEEDO foreign key (CEDU_PROVE)
      references PROVEEDOR (CEDU_PROVE)
      on delete restrict on update restrict;

alter table DETALLEORDEN
   add constraint FK_DETALLEO_DETALLEOR_ORDENPED foreign key (NUME_ORDEN)
      references ORDENPEDIDO (NUME_ORDEN)
      on delete restrict on update restrict;

alter table DETALLEORDEN
   add constraint FK_DETALLEO_DETALLEOR_BIEN foreign key (CODI_ITEM)
      references BIEN (CODI_ITEM)
      on delete restrict on update restrict;

alter table DETALLESALIDA
   add constraint FK_DETALLES_DETALEBIE_BIEN foreign key (CODI_ITEM)
      references BIEN (CODI_ITEM)
      on delete restrict on update restrict;

alter table DETALLESALIDA
   add constraint FK_DETALLES_DETALLEEM_EMPLEADO foreign key (CEDU_EMPLE)
      references EMPLEADO (CEDU_EMPLE)
      on delete restrict on update restrict;

alter table DETALLESALIDA
   add constraint FK_DETALLES_DETALLESA_SALIDAAL foreign key (NUME_SALI)
      references SALIDAALMACEN (NUME_SALI)
      on delete restrict on update restrict;

alter table DETALLESOLICITUD
   add constraint FK_DETALLES_DETALLEIT_SOLICITU foreign key (NUME_SOLI)
      references SOLICITUD (NUME_SOLI)
      on delete restrict on update restrict;

alter table DETALLESOLICITUD
   add constraint FK_DETALLES_ITEMDETAL_BIEN foreign key (CODI_ITEM)
      references BIEN (CODI_ITEM)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_AREAEMPLE_AREA foreign key (CODI_AREA)
      references AREA (CODI_AREA)
      on delete restrict on update restrict;

alter table ORDENPEDIDO
   add constraint FK_ORDENPED_ORDENPROV_PROVEEDO foreign key (CEDU_PROVE)
      references PROVEEDOR (CEDU_PROVE)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_AREASOLIC_AREA foreign key (CODI_AREA)
      references AREA (CODI_AREA)
      on delete restrict on update restrict;

