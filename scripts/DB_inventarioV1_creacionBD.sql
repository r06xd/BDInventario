/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     20/12/2018 4:56:49                           */
/*==============================================================*/


drop index ALMACEN_PK;

drop table ALMACEN;

drop index RESPONSABLEBIEN_FK;

drop index BIEN_PK;

drop table BIEN;

drop index ORDENCOMPRAS_FK;

drop index COMPRAS_PK;

drop table COMPRAS;

drop index ITEMSFACTURA_FK;

drop index DETALLEFACTURA_FK;

drop index DETALLEFACTURA_PK;

drop table DETALLEFACTURA;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index ALMACENFACTURAS_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index INVENTARIOTOTAL_FK;

drop index INVENTARIO_PK;

drop table INVENTARIO;

drop index ITEMSBIEN_FK;

drop index PROVEEDORITEM_FK;

drop index ORDENITEMS_FK;

drop index SOLICITUDES_ITEMS_FK;

drop index ITEMS_PK;

drop table ITEMS;

drop index ORDENPROVEEDOR_FK;

drop index ORDENPEDIDO_PK;

drop table ORDENPEDIDO;

drop index PROVEEDOR_PK;

drop table PROVEEDOR;

drop index ALMACENSALIDAS_FK;

drop index SALIDASALMACEN_PK;

drop table SALIDASALMACEN;

drop index EMPLEADO_SOLICITUD_FK;

drop index SOLICITUDES_PK;

drop table SOLICITUDES;

/*==============================================================*/
/* Table: ALMACEN                                               */
/*==============================================================*/
create table ALMACEN (
   ID_ALMACEN           INT4                 not null,
   constraint PK_ALMACEN primary key (ID_ALMACEN)
);

/*==============================================================*/
/* Index: ALMACEN_PK                                            */
/*==============================================================*/
create unique index ALMACEN_PK on ALMACEN (
ID_ALMACEN
);

/*==============================================================*/
/* Table: BIEN                                                  */
/*==============================================================*/
create table BIEN (
   ID_BIEN              INT4                 not null,
   CEDU_EMPL            INT4                 null,
   FECHA_ENTREGA        DATE                 null,
   DIRECCION            TEXT                 null,
   constraint PK_BIEN primary key (ID_BIEN)
);

/*==============================================================*/
/* Index: BIEN_PK                                               */
/*==============================================================*/
create unique index BIEN_PK on BIEN (
ID_BIEN
);

/*==============================================================*/
/* Index: RESPONSABLEBIEN_FK                                    */
/*==============================================================*/
create  index RESPONSABLEBIEN_FK on BIEN (
CEDU_EMPL
);

/*==============================================================*/
/* Table: COMPRAS                                               */
/*==============================================================*/
create table COMPRAS (
   ID_COMPRAS           INT4                 not null,
   ID_ORDEN_PEDIDO      INT4                 null,
   SOLICITUD_NUMERO_SOLICITUD INT4                 null,
   ORDENPEDIDO_NUMERO_ORDEN INT4                 null,
   INVENTARIO_IDINVENTARIO INT4                 null,
   constraint PK_COMPRAS primary key (ID_COMPRAS)
);

/*==============================================================*/
/* Index: COMPRAS_PK                                            */
/*==============================================================*/
create unique index COMPRAS_PK on COMPRAS (
ID_COMPRAS
);

/*==============================================================*/
/* Index: ORDENCOMPRAS_FK                                       */
/*==============================================================*/
create  index ORDENCOMPRAS_FK on COMPRAS (
ID_ORDEN_PEDIDO
);

/*==============================================================*/
/* Table: DETALLEFACTURA                                        */
/*==============================================================*/
create table DETALLEFACTURA (
   NUM_DETALLE          INT4                 not null,
   NUMERO_FACTURA       TEXT                 null,
   ID_ITEMS             INT4                 null,
   TOTAL_ITEMS          INT4                 null,
   VALOR_TOTAL          DECIMAL              null,
   constraint PK_DETALLEFACTURA primary key (NUM_DETALLE)
);

/*==============================================================*/
/* Index: DETALLEFACTURA_PK                                     */
/*==============================================================*/
create unique index DETALLEFACTURA_PK on DETALLEFACTURA (
NUM_DETALLE
);

/*==============================================================*/
/* Index: DETALLEFACTURA_FK                                     */
/*==============================================================*/
create  index DETALLEFACTURA_FK on DETALLEFACTURA (
NUMERO_FACTURA
);

/*==============================================================*/
/* Index: ITEMSFACTURA_FK                                       */
/*==============================================================*/
create  index ITEMSFACTURA_FK on DETALLEFACTURA (
ID_ITEMS
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CEDU_EMPL            INT4                 not null,
   NOMB_EMPL            VARCHAR(50)          null,
   APELL_EMPL           VARCHAR(50)          null,
   constraint PK_EMPLEADO primary key (CEDU_EMPL)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
CEDU_EMPL
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   NUMERO_FACTURA       TEXT                 not null,
   ID_ALMACEN           INT4                 null,
   FECHA                DATE                 null,
   ALMACEN_ID_ALMACEN   INT4                 null,
   constraint PK_FACTURA primary key (NUMERO_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
NUMERO_FACTURA
);

/*==============================================================*/
/* Index: ALMACENFACTURAS_FK                                    */
/*==============================================================*/
create  index ALMACENFACTURAS_FK on FACTURA (
ID_ALMACEN
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO (
   ID_INVENTARIO        INT4                 not null,
   ID_ITEMS             INT4                 null,
   ITEM_RESTANTES       INT4                 null,
   ITEM_VENDIDOS        INT4                 null,
   TOTAL_INVENTARIO     INT4                 null,
   constraint PK_INVENTARIO primary key (ID_INVENTARIO)
);

/*==============================================================*/
/* Index: INVENTARIO_PK                                         */
/*==============================================================*/
create unique index INVENTARIO_PK on INVENTARIO (
ID_INVENTARIO
);

/*==============================================================*/
/* Index: INVENTARIOTOTAL_FK                                    */
/*==============================================================*/
create  index INVENTARIOTOTAL_FK on INVENTARIO (
ID_ITEMS
);

/*==============================================================*/
/* Table: ITEMS                                                 */
/*==============================================================*/
create table ITEMS (
   ID_ITEMS             INT4                 not null,
   ID_SOLICITUDES       INT4                 null,
   ID_ORDEN_PEDIDO      INT4                 null,
   CEDULA_PROVEE        INT4                 null,
   ID_BIEN              INT4                 null,
   NOMBRE_BIEN          TEXT                 null,
   CANTIDAD             INT4                 null,
   VALOR_UNITARIO       DECIMAL              null,
   VALOR_TOTAL          DECIMAL              null,
   SOLICITUDES_NUMERO_SOLICITUD INT4                 null,
   FACTURA_NUMERO_ENTRADA INT4                 null,
   ORDENPEDIDO_NUMERO_ORDEN INT4                 null,
   constraint PK_ITEMS primary key (ID_ITEMS)
);

/*==============================================================*/
/* Index: ITEMS_PK                                              */
/*==============================================================*/
create unique index ITEMS_PK on ITEMS (
ID_ITEMS
);

/*==============================================================*/
/* Index: SOLICITUDES_ITEMS_FK                                  */
/*==============================================================*/
create  index SOLICITUDES_ITEMS_FK on ITEMS (
ID_SOLICITUDES
);

/*==============================================================*/
/* Index: ORDENITEMS_FK                                         */
/*==============================================================*/
create  index ORDENITEMS_FK on ITEMS (
ID_ORDEN_PEDIDO
);

/*==============================================================*/
/* Index: PROVEEDORITEM_FK                                      */
/*==============================================================*/
create  index PROVEEDORITEM_FK on ITEMS (
CEDULA_PROVEE
);

/*==============================================================*/
/* Index: ITEMSBIEN_FK                                          */
/*==============================================================*/
create  index ITEMSBIEN_FK on ITEMS (
ID_BIEN
);

/*==============================================================*/
/* Table: ORDENPEDIDO                                           */
/*==============================================================*/
create table ORDENPEDIDO (
   ID_ORDEN_PEDIDO      INT4                 not null,
   CEDULA_PROVEE        INT4                 null,
   NUM_ORDEN            INT4                 null,
   FECHA_ORDEN          DATE                 null,
   FECHA_ENTREGA        DATE                 null,
   VALOR_TOTAL          DECIMAL              null,
   constraint PK_ORDENPEDIDO primary key (ID_ORDEN_PEDIDO)
);

/*==============================================================*/
/* Index: ORDENPEDIDO_PK                                        */
/*==============================================================*/
create unique index ORDENPEDIDO_PK on ORDENPEDIDO (
ID_ORDEN_PEDIDO
);

/*==============================================================*/
/* Index: ORDENPROVEEDOR_FK                                     */
/*==============================================================*/
create  index ORDENPROVEEDOR_FK on ORDENPEDIDO (
CEDULA_PROVEE
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   CEDULA_PROVEE        INT4                 not null,
   NOMBR_PROVEE         VARCHAR(50)          null,
   APELL_PROVEE         VARCHAR(50)          null,
   NOMB_EMPRESA         VARCHAR(100)         null,
   constraint PK_PROVEEDOR primary key (CEDULA_PROVEE)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
CEDULA_PROVEE
);

/*==============================================================*/
/* Table: SALIDASALMACEN                                        */
/*==============================================================*/
create table SALIDASALMACEN (
   ID_SALIDAS_ALMACEN   INT4                 not null,
   ID_ALMACEN           INT4                 null,
   EMPLEADO             TEXT                 null,
   FECHA_SALIDA         DATE                 null,
   FECHA_ENTREGA        DATE                 null,
   ALMACEN_ID_ALMACEN   INT4                 null,
   constraint PK_SALIDASALMACEN primary key (ID_SALIDAS_ALMACEN)
);

/*==============================================================*/
/* Index: SALIDASALMACEN_PK                                     */
/*==============================================================*/
create unique index SALIDASALMACEN_PK on SALIDASALMACEN (
ID_SALIDAS_ALMACEN
);

/*==============================================================*/
/* Index: ALMACENSALIDAS_FK                                     */
/*==============================================================*/
create  index ALMACENSALIDAS_FK on SALIDASALMACEN (
ID_ALMACEN
);

/*==============================================================*/
/* Table: SOLICITUDES                                           */
/*==============================================================*/
create table SOLICITUDES (
   ID_SOLICITUDES       INT4                 not null,
   CEDU_EMPL            INT4                 null,
   CEDULA_RESPONSABLE   INT4                 null,
   FECHA_SOLICITUD      DATE                 null,
   NOMBRE_RESPONSABLE   TEXT                 null,
   STATUS               TEXT                 null,
   constraint PK_SOLICITUDES primary key (ID_SOLICITUDES)
);

/*==============================================================*/
/* Index: SOLICITUDES_PK                                        */
/*==============================================================*/
create unique index SOLICITUDES_PK on SOLICITUDES (
ID_SOLICITUDES
);

/*==============================================================*/
/* Index: EMPLEADO_SOLICITUD_FK                                 */
/*==============================================================*/
create  index EMPLEADO_SOLICITUD_FK on SOLICITUDES (
CEDU_EMPL
);

alter table BIEN
   add constraint FK_BIEN_RESPONSAB_EMPLEADO foreign key (CEDU_EMPL)
      references EMPLEADO (CEDU_EMPL)
      on delete restrict on update restrict;

alter table COMPRAS
   add constraint FK_COMPRAS_ORDENCOMP_ORDENPED foreign key (ID_ORDEN_PEDIDO)
      references ORDENPEDIDO (ID_ORDEN_PEDIDO)
      on delete restrict on update restrict;

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_DETALLEFA_FACTURA foreign key (NUMERO_FACTURA)
      references FACTURA (NUMERO_FACTURA)
      on delete restrict on update restrict;

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_ITEMSFACT_ITEMS foreign key (ID_ITEMS)
      references ITEMS (ID_ITEMS)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_ALMACENFA_ALMACEN foreign key (ID_ALMACEN)
      references ALMACEN (ID_ALMACEN)
      on delete restrict on update restrict;

alter table INVENTARIO
   add constraint FK_INVENTAR_INVENTARI_ITEMS foreign key (ID_ITEMS)
      references ITEMS (ID_ITEMS)
      on delete restrict on update restrict;

alter table ITEMS
   add constraint FK_ITEMS_ITEMSBIEN_BIEN foreign key (ID_BIEN)
      references BIEN (ID_BIEN)
      on delete restrict on update restrict;

alter table ITEMS
   add constraint FK_ITEMS_ORDENITEM_ORDENPED foreign key (ID_ORDEN_PEDIDO)
      references ORDENPEDIDO (ID_ORDEN_PEDIDO)
      on delete restrict on update restrict;

alter table ITEMS
   add constraint FK_ITEMS_PROVEEDOR_PROVEEDO foreign key (CEDULA_PROVEE)
      references PROVEEDOR (CEDULA_PROVEE)
      on delete restrict on update restrict;

alter table ITEMS
   add constraint FK_ITEMS_SOLICITUD_SOLICITU foreign key (ID_SOLICITUDES)
      references SOLICITUDES (ID_SOLICITUDES)
      on delete restrict on update restrict;

alter table ORDENPEDIDO
   add constraint FK_ORDENPED_ORDENPROV_PROVEEDO foreign key (CEDULA_PROVEE)
      references PROVEEDOR (CEDULA_PROVEE)
      on delete restrict on update restrict;

alter table SALIDASALMACEN
   add constraint FK_SALIDASA_ALMACENSA_ALMACEN foreign key (ID_ALMACEN)
      references ALMACEN (ID_ALMACEN)
      on delete restrict on update restrict;

alter table SOLICITUDES
   add constraint FK_SOLICITU_EMPLEADO__EMPLEADO foreign key (CEDU_EMPL)
      references EMPLEADO (CEDU_EMPL)
      on delete restrict on update restrict;

