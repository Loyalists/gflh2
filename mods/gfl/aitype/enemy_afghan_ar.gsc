// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "axis";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 8 ) )
    {
        case 0:
            self.weapon = "ak47_desert";
            break;
        case 1:
            self.weapon = "ak47_reflex";
            break;
        case 2:
            self.weapon = "ak47_desert_grenadier";
            break;
        case 3:
            self.weapon = "ak47_acog";
            break;
        case 4:
            self.weapon = "fal";
            break;
        case 5:
            self.weapon = "fal_acog";
            break;
        case 6:
            self.weapon = "ak47_desert";
            break;
        case 7:
            self.weapon = "fal_shotgun";
            break;
    }

    character\gfl\randomizer_afghan_ar::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_afghan_ar::precache();
    precacheitem( "ak47_desert" );
    precacheitem( "ak47_reflex" );
    precacheitem( "ak47_desert_grenadier" );
    precacheitem( "gl_ak47_desert" );
    precacheitem( "ak47_acog" );
    precacheitem( "fal" );
    precacheitem( "fal_acog" );
    precacheitem( "ak47_desert" );
    precacheitem( "fal_shotgun" );
    precacheitem( "fal_shotgun_attach" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
}
