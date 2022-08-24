CREATE TABLE materiau (
    id SERIAL,
    nom VARCHAR(128) UNIQUE,
    mod_young_eff REAL,
    mode_elast REAL,
    temperature_fusion REAL,
    coeff_poisson REAL,
    cond_thermique REAL,
    lim_elast REAL,
    PRIMARY KEY (id)
    );
CREATE TABLE machine (
    id SERIAL,
    nom VARCHAR(128) UNIQUE,
    type_mvt VARCHAR(128),
    forme_mvt VARCHAR(128),
    PRIMARY KEY(id)
    );
CREATE TABLE lubrifiant (
    id SERIAL,
    nom VARCHAR(128) UNIQUE,
    viscosite REAL,
    type_lubrifiant VARCHAR(128),
    famille VARCHAR(128),
    PRIMARY KEY(id)
    );

CREATE TABLE essai (
    id SERIAL,
    nom VARCHAR(128) UNIQUE, 
    date_essai DATE, 
    time_essai TIME,
    type_contact VARCHAR(128),
    coeff_moy_frottement REAL, 
    taux_usure REAL, 
    temperature REAL, 
    pression REAL,
    dist_glissement REAL,
    frequence REAL, 
    charge_app REAL, 
    mode_usure VARCHAR(128), 
    trace_fixe REAL, 
    trace_mobile REAL, 
    hum_absolue REAL, 
    def_pla_app REAL,
    force_frottement REAL, 
    surf_cont_hertz REAL,
    surf_reel_cont REAL, 
    vit_glissement REAL, 
    chal_spec REAL, 
    vol_abrasion REAL,
    vol_adhesion REAL, 
    vol_fatique REAL,
    fixe_id INTEGER REFERENCES materiau(id) ON DELETE CASCADE, 
    mobile_id INTEGER REFERENCES materiau(id) ON DELETE CASCADE,
    machine_id INTEGER REFERENCES machine(id) ON DELETE SET NULL,
    lubrifiant_id INTEGER REFERENCES lubrifiant(id) ON DELETE SET NULL,
    PRIMARY KEY (id)
    );
CREATE TABLE resultats_essai (
    id SERIAL,
    temps INTEGER,
    eff_tangentiel REAL,
    temperature REAL,
    res_electrique REAL,
    usure REAL,
    eff_tangentiel_inst REAL,
    charge REAL,
    t6 REAL,
    t7 REAL,
    coeff_frottement REAL,
    essai_id INTEGER REFERENCES essai(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);
CREATE TABLE banc_essai (
    id SERIAL,
    type_mat VARCHAR(128),
    nom VARCHAR(128) UNIQUE,
    chemin VARCHAR,
    essai_id INTEGER REFERENCES essai(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);
CREATE TABLE videomicroscopie (
    id SERIAL,
    type_mat VARCHAR(128),
    nom VARCHAR(128) UNIQUE,
    chemin VARCHAR,
    essai_id INTEGER REFERENCES essai(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);
CREATE TABLE profilometre (
    id SERIAL,
    nom VARCHAR(128) UNIQUE,
    type_mat VARCHAR(128),
    type_image VARCHAR(128),
    chemin VARCHAR,
    essai_id INTEGER REFERENCES essai(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);
