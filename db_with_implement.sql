#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: users
#------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `gta5_gamemode_essential` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gta5_gamemode_essential`;

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE users(
       `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
       `group` varchar(50) NOT NULL DEFAULT '0',
       `permission_level` int(11) NOT NULL DEFAULT '0',
       `money` double NOT NULL DEFAULT '0',       
        IDpersonnage Int NOT NULL ,
        nom          Varchar (15) ,
        prenom       Varchar (15) ,
        liquide      Int ,
        money_bank   Int ,
        position     Varchar (25) ,
        IDmetier     Int ,
        IDinventaire Int ,
        PRIMARY KEY (IDpersonnage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Metier
#------------------------------------------------------------

CREATE TABLE Metier(
        IDmetier Int NOT NULL ,
        nom      Varchar (15) ,
        salaire  Int ,
        PRIMARY KEY (IDmetier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Voiture
#------------------------------------------------------------

CREATE TABLE Voiture(
        IDvoiture    Int NOT NULL ,
        nom          Varchar (15) ,
        modele       Varchar (25) ,
        immat        Varchar (6) ,
        prix         Int ,
        localisation Varchar (25) ,
        IDpersonnage Int ,
        PRIMARY KEY (IDvoiture )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Propriete
#------------------------------------------------------------

CREATE TABLE Propriete(
        IDpropriete Int NOT NULL ,
        nom         Char (25) ,
        gps         Varchar (25) ,
        PRIMARY KEY (IDpropriete )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Inventaire
#------------------------------------------------------------

CREATE TABLE Inventaire(
        IDinventaire Int NOT NULL ,
        PRIMARY KEY (IDinventaire )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Nourriture
#------------------------------------------------------------

CREATE TABLE Nourriture(
        IDnourriture Int NOT NULL ,
        nom          Varchar (25) ,
        nombre       Int ,
        PRIMARY KEY (IDnourriture )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Etat
#------------------------------------------------------------

CREATE TABLE Etat(
        IDetat  Int NOT NULL ,
        sante   Int ,
        faim    Int ,
        hydrate Int ,
        PRIMARY KEY (IDetat )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Arme
#------------------------------------------------------------

CREATE TABLE Arme(
        IDarme Int NOT NULL ,
        nom    Varchar (25) ,
        PRIMARY KEY (IDarme )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Avantage
#------------------------------------------------------------

CREATE TABLE Avantage(
        IDavantage Int NOT NULL ,
        PRIMARY KEY (IDavantage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EntreprisePrive
#------------------------------------------------------------

CREATE TABLE EntreprisePrive(
        IDentrepriseprive Int NOT NULL ,
        nom               Varchar (25) ,
        PRIMARY KEY (IDentrepriseprive )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Bank
#------------------------------------------------------------

CREATE TABLE Bank(
        IDbank Int NOT NULL ,
        PRIMARY KEY (IDbank )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EntreprisePublique
#------------------------------------------------------------

CREATE TABLE EntreprisePublique(
        IDentreprisepublique Int NOT NULL ,
        PRIMARY KEY (IDentreprisepublique )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: POSSEDER_ETAT
#------------------------------------------------------------

CREATE TABLE POSSEDER_ETAT(
        IDetat       Int NOT NULL ,
        IDpersonnage Int NOT NULL ,
        PRIMARY KEY (IDetat ,IDpersonnage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CONTENIR_INVEN_ARME
#------------------------------------------------------------

CREATE TABLE CONTENIR_INVEN_ARME(
        IDinventaire Int NOT NULL ,
        IDarme       Int NOT NULL ,
        PRIMARY KEY (IDinventaire ,IDarme )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CONTENIR_NOURRI
#------------------------------------------------------------

CREATE TABLE CONTENIR_NOURRI(
        IDinventaire Int NOT NULL ,
        IDnourriture Int NOT NULL ,
        PRIMARY KEY (IDinventaire ,IDnourriture )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: POSSEDER_PROPRIETE
#------------------------------------------------------------

CREATE TABLE POSSEDER_PROPRIETE(
        IDpersonnage Int NOT NULL ,
        IDpropriete  Int NOT NULL ,
        PRIMARY KEY (IDpersonnage ,IDpropriete )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: AVANTAGE_METIER
#------------------------------------------------------------

CREATE TABLE AVANTAGE_METIER(
        IDmetier   Int NOT NULL ,
        IDavantage Int NOT NULL ,
        PRIMARY KEY (IDmetier ,IDavantage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: AVANTAGE_VOITURE
#------------------------------------------------------------

CREATE TABLE AVANTAGE_VOITURE(
        IDvoiture  Int NOT NULL ,
        IDavantage Int NOT NULL ,
        PRIMARY KEY (IDvoiture ,IDavantage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: AVANTAGE_APPARTEMENT
#------------------------------------------------------------

CREATE TABLE AVANTAGE_APPARTEMENT(
        IDpropriete Int NOT NULL ,
        IDavantage  Int NOT NULL ,
        PRIMARY KEY (IDpropriete ,IDavantage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: POSSEDER_ENTR
#------------------------------------------------------------

CREATE TABLE POSSEDER_ENTR(
        IDpersonnage      Int NOT NULL ,
        IDentrepriseprive Int NOT NULL ,
        PRIMARY KEY (IDpersonnage ,IDentrepriseprive )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: POSSEDER_METIER_PRIVE
#------------------------------------------------------------

CREATE TABLE POSSEDER_METIER_PRIVE(
        IDentrepriseprive Int NOT NULL ,
        IDmetier          Int NOT NULL ,
        PRIMARY KEY (IDentrepriseprive ,IDmetier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: STOCK_PERSO_BANK
#------------------------------------------------------------

CREATE TABLE STOCK_PERSO_BANK(
        IDpersonnage Int NOT NULL ,
        IDbank       Int NOT NULL ,
        PRIMARY KEY (IDpersonnage ,IDbank )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: STOCK_ENTR_BANK
#------------------------------------------------------------

CREATE TABLE STOCK_ENTR_BANK(
        IDbank            Int NOT NULL ,
        IDentrepriseprive Int NOT NULL ,
        PRIMARY KEY (IDbank ,IDentrepriseprive )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: POSSEDER_METIER_PUBLIQUE
#------------------------------------------------------------

CREATE TABLE POSSEDER_METIER_PUBLIQUE(
        IDmetier             Int NOT NULL ,
        IDentreprisepublique Int NOT NULL ,
        PRIMARY KEY (IDmetier ,IDentreprisepublique )
)ENGINE=InnoDB;

ALTER TABLE users ADD CONSTRAINT FK_users_IDmetier FOREIGN KEY (IDmetier) REFERENCES Metier(IDmetier);
ALTER TABLE users ADD CONSTRAINT FK_users_IDinventaire FOREIGN KEY (IDinventaire) REFERENCES Inventaire(IDinventaire);
ALTER TABLE Voiture ADD CONSTRAINT FK_Voiture_IDpersonnage FOREIGN KEY (IDpersonnage) REFERENCES users(IDpersonnage);
ALTER TABLE POSSEDER_ETAT ADD CONSTRAINT FK_POSSEDER_ETAT_IDetat FOREIGN KEY (IDetat) REFERENCES Etat(IDetat);
ALTER TABLE POSSEDER_ETAT ADD CONSTRAINT FK_POSSEDER_ETAT_IDpersonnage FOREIGN KEY (IDpersonnage) REFERENCES users(IDpersonnage);
ALTER TABLE CONTENIR_INVEN_ARME ADD CONSTRAINT FK_CONTENIR_INVEN_ARME_IDinventaire FOREIGN KEY (IDinventaire) REFERENCES Inventaire(IDinventaire);
ALTER TABLE CONTENIR_INVEN_ARME ADD CONSTRAINT FK_CONTENIR_INVEN_ARME_IDarme FOREIGN KEY (IDarme) REFERENCES Arme(IDarme);
ALTER TABLE CONTENIR_NOURRI ADD CONSTRAINT FK_CONTENIR_NOURRI_IDinventaire FOREIGN KEY (IDinventaire) REFERENCES Inventaire(IDinventaire);
ALTER TABLE CONTENIR_NOURRI ADD CONSTRAINT FK_CONTENIR_NOURRI_IDnourriture FOREIGN KEY (IDnourriture) REFERENCES Nourriture(IDnourriture);
ALTER TABLE POSSEDER_PROPRIETE ADD CONSTRAINT FK_POSSEDER_PROPRIETE_IDpersonnage FOREIGN KEY (IDpersonnage) REFERENCES users(IDpersonnage);
ALTER TABLE POSSEDER_PROPRIETE ADD CONSTRAINT FK_POSSEDER_PROPRIETE_IDpropriete FOREIGN KEY (IDpropriete) REFERENCES Propriete(IDpropriete);
ALTER TABLE AVANTAGE_METIER ADD CONSTRAINT FK_AVANTAGE_METIER_IDmetier FOREIGN KEY (IDmetier) REFERENCES Metier(IDmetier);
ALTER TABLE AVANTAGE_METIER ADD CONSTRAINT FK_AVANTAGE_METIER_IDavantage FOREIGN KEY (IDavantage) REFERENCES Avantage(IDavantage);
ALTER TABLE AVANTAGE_VOITURE ADD CONSTRAINT FK_AVANTAGE_VOITURE_IDvoiture FOREIGN KEY (IDvoiture) REFERENCES Voiture(IDvoiture);
ALTER TABLE AVANTAGE_VOITURE ADD CONSTRAINT FK_AVANTAGE_VOITURE_IDavantage FOREIGN KEY (IDavantage) REFERENCES Avantage(IDavantage);
ALTER TABLE AVANTAGE_APPARTEMENT ADD CONSTRAINT FK_AVANTAGE_APPARTEMENT_IDpropriete FOREIGN KEY (IDpropriete) REFERENCES Propriete(IDpropriete);
ALTER TABLE AVANTAGE_APPARTEMENT ADD CONSTRAINT FK_AVANTAGE_APPARTEMENT_IDavantage FOREIGN KEY (IDavantage) REFERENCES Avantage(IDavantage);
ALTER TABLE POSSEDER_ENTR ADD CONSTRAINT FK_POSSEDER_ENTR_IDpersonnage FOREIGN KEY (IDpersonnage) REFERENCES users(IDpersonnage);
ALTER TABLE POSSEDER_ENTR ADD CONSTRAINT FK_POSSEDER_ENTR_IDentrepriseprive FOREIGN KEY (IDentrepriseprive) REFERENCES EntreprisePrive(IDentrepriseprive);
ALTER TABLE POSSEDER_METIER_PRIVE ADD CONSTRAINT FK_POSSEDER_METIER_PRIVE_IDentrepriseprive FOREIGN KEY (IDentrepriseprive) REFERENCES EntreprisePrive(IDentrepriseprive);
ALTER TABLE POSSEDER_METIER_PRIVE ADD CONSTRAINT FK_POSSEDER_METIER_PRIVE_IDmetier FOREIGN KEY (IDmetier) REFERENCES Metier(IDmetier);
ALTER TABLE STOCK_PERSO_BANK ADD CONSTRAINT FK_STOCK_PERSO_BANK_IDpersonnage FOREIGN KEY (IDpersonnage) REFERENCES users(IDpersonnage);
ALTER TABLE STOCK_PERSO_BANK ADD CONSTRAINT FK_STOCK_PERSO_BANK_IDbank FOREIGN KEY (IDbank) REFERENCES Bank(IDbank);
ALTER TABLE STOCK_ENTR_BANK ADD CONSTRAINT FK_STOCK_ENTR_BANK_IDbank FOREIGN KEY (IDbank) REFERENCES Bank(IDbank);
ALTER TABLE STOCK_ENTR_BANK ADD CONSTRAINT FK_STOCK_ENTR_BANK_IDentrepriseprive FOREIGN KEY (IDentrepriseprive) REFERENCES EntreprisePrive(IDentrepriseprive);
ALTER TABLE POSSEDER_METIER_PUBLIQUE ADD CONSTRAINT FK_POSSEDER_METIER_PUBLIQUE_IDmetier FOREIGN KEY (IDmetier) REFERENCES Metier(IDmetier);
ALTER TABLE POSSEDER_METIER_PUBLIQUE ADD CONSTRAINT FK_POSSEDER_METIER_PUBLIQUE_IDentreprisepublique FOREIGN KEY (IDentreprisepublique) REFERENCES EntreprisePublique(IDentreprisepublique);
