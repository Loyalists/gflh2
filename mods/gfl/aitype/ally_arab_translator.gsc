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

    switch ( codescripts\character::get_random_weapon( 12 ) )
    {
        case 0:
            self.weapon = "m16_basic";
            break;
        case 1:
            self.weapon = "m240";
            break;
        case 2:
            self.weapon = "m16_grenadier";
            break;
        case 3:
            self.weapon = "m240_reflex";
            break;
        case 4:
            self.weapon = "m16_acog";
            break;
        case 5:
            self.weapon = "m240_acog";
            break;
        case 6:
            self.weapon = "m4_grenadier";
            break;
        case 7:
            self.weapon = "scar_h_acog";
            break;
        case 8:
            self.weapon = "m4_grunt";
            break;
        case 9:
            self.weapon = "scar_h_shotgun";
            break;
        case 10:
            self.weapon = "scar_h_reflex";
            break;
        case 11:
            self.weapon = "scar_h_grenadier";
            break;
    }

    character\character_hamed::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\character_hamed::precache();
    precacheitem( "m16_basic" );
    precacheitem( "m240" );
    precacheitem( "m16_grenadier" );
    precacheitem( "m203_m16" );
    precacheitem( "m240_reflex" );
    precacheitem( "m16_acog" );
    precacheitem( "m240_acog" );
    precacheitem( "m4_grenadier" );
    precacheitem( "m203_m4" );
    precacheitem( "scar_h_acog" );
    precacheitem( "m4_grunt" );
    precacheitem( "scar_h_shotgun" );
    precacheitem( "scar_h_shotgun_attach" );
    precacheitem( "scar_h_reflex" );
    precacheitem( "scar_h_grenadier" );
    precacheitem( "scar_h_m203" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
