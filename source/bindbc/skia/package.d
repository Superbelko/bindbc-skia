module bindbc.skia;

public import bindbc.skia.types;

version(BindBC_Static) version = BindSkia_Static;
version(BindSkia_Static) public import bindbc.skia.bindstatic;
else public import bindbc.skia.binddynamic;