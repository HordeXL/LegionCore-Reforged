-- Character templates: the Alliance classes use faction group 3 (player and Alliance); 6 was rejected at load and greyed every Alliance class
UPDATE `character_template_class` SET `factionGroup` = 3 WHERE `factionGroup` = 6;
