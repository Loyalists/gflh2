// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "allies";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 100;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 17 ) )
    {
        case 0:
            self.weapon = "m4_grenadier";
            break;
        case 1:
            self.weapon = "m4_grunt";
            break;
        case 2:
            self.weapon = "m4m203_acog";
            break;
        case 3:
            self.weapon = "m4m203_eotech";
            break;
        case 4:
            self.weapon = "m4m203_reflex";
            break;
        case 5:
            self.weapon = "tavor_acog";
            break;
        case 6:
            self.weapon = "tavor_mars";
            break;
        case 7:
            self.weapon = "m16_acog";
            break;
        case 8:
            self.weapon = "m16_grenadier";
            break;
        case 9:
            self.weapon = "m16_reflex";
            break;
        case 10:
            self.weapon = "masada";
            break;
        case 11:
            self.weapon = "masada_acog";
            break;
        case 12:
            self.weapon = "masada_reflex";
            break;
        case 13:
            self.weapon = "scar_h";
            break;
        case 14:
            self.weapon = "scar_h_acog";
            break;
        case 15:
            self.weapon = "scar_h_reflex";
            break;
        case 16:
            self.weapon = "scar_h_shotgun";
            break;
    }

    character\character_tf_141_forest_scarecrow::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\character_tf_141_forest_scarecrow::precache();
    precacheitem( "m4_grenadier" );
    precacheitem( "m203_m4" );
    precacheitem( "m4_grunt" );
    precacheitem( "m4m203_acog" );
    precacheitem( "m203_m4_acog" );
    precacheitem( "m4m203_eotech" );
    precacheitem( "m203_m4_eotech" );
    precacheitem( "m4m203_reflex" );
    precacheitem( "m203_m4_reflex" );
    precacheitem( "tavor_acog" );
    precacheitem( "tavor_mars" );
    precacheitem( "m16_acog" );
    precacheitem( "m16_grenadier" );
    precacheitem( "m203_m16" );
    precacheitem( "m16_reflex" );
    precacheitem( "masada" );
    precacheitem( "masada_acog" );
    precacheitem( "masada_reflex" );
    precacheitem( "scar_h" );
    precacheitem( "scar_h_acog" );
    precacheitem( "scar_h_reflex" );
    precacheitem( "scar_h_shotgun" );
    precacheitem( "scar_h_shotgun_attach" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
