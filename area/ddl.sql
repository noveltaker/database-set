create table area_code
(
    id          bigint                                 not null
        primary key,
    area_code   varchar(255)                           null,
    create_by   varchar(255) default 'system'          null,
    create_date datetime     default CURRENT_TIMESTAMP null,
    area_name   varchar(255)                           null,
    area_type   varchar(255)                           null,
    parent_id   bigint                                 null
)
    engine = MyISAM;

create index FK4lq5283vdb7l4lpobgwlt4m94
    on area_code (parent_id);

