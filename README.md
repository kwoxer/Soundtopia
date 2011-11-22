Projekt Soundtopia
========================

Version
-------
* Alpha - Stadium

Autoren
------- 
* MK
* JM
* SL
* BH

Kurzbeschreibung
----------------
Erstellung eines Musik Portals

Hinweise
========
* JBoss 7.0.2 Final herunterladen und installieren
* XAMPP herunterladen/installieren (mit install_xampp.bat)
* JBoss Tools herunterladen (�ber Eclipse Help/Install SW/...) -> http://download.jboss.org/jbosstools/updates/development/indigo/
* Java mySql Connector herunterladen, in standalone/deployments reinlegen (die ...-bin.jar - Datei)
* localhost:8080 (bei gestartetem JBoss-Server) -> Admin Console -> new Datasource (SoundtopiaDS, java:/SoundtopiaDS, jdbc:mysql://127.0.0.1:3306/soundtopia, root)
* Datenbank �ber localhost/phpmyadmin erreichbar
* Data Source Explorer/anlegen (Java 5.1 "*-bin.jar" einbinden)
* XML Datei �ndern (<non-jta-data-source>...<..>)
* JPA Facet aktivieren (Generic 2.0) -> JPA/entities from tables... Ausw�hlen, Beziehungen ...
* ACHTUNG: bei "...bag"-Fehler: "Set" anstelle von "List" verwenden (oder EAGER) entfernen

F�r die Anbindung von Web Services: 
* Editieren der standalone.xml (http://jbossws.blogspot.com/2011/07/jboss-as-7-webservices-features.html)
* Module hinzuf�gen (http://www.jboss.org/jbossas/downloads/ -> "Everything (NOT Java EE6 Certified)" aus module-Unterodner herauskopieren)