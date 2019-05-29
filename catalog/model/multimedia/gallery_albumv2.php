<?php
class ModelMultimediaGalleryAlbumv2 extends Model {
	public function getAlbums($parent_id) {
	    $sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "albumv2 c LEFT JOIN " . DB_PREFIX . "album_descriptionv2 cd ON (c.album_id = cd.album_id) LEFT JOIN " . DB_PREFIX . "album_to_storev2 c2s ON (c.album_id = c2s.album_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getAlbumDescription($album_id) {
	    $sql = "";
    }
	
	public function getAlbum($album_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "albumv2 c LEFT JOIN " . DB_PREFIX . "album_descriptionv2 cd ON (c.album_id = cd.album_id) LEFT JOIN " . DB_PREFIX . "album_to_storev2 c2s ON (c.album_id = c2s.album_id) WHERE c.album_id = '" . (int)$album_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		return $query->row;
	}
	
	public function scanCatalogs($album_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "album_catalogsv2 WHERE album_id = '" . (int)$album_id . "' AND language_id = '" . $this->config->get('config_language_id') . "' ORDER BY sort_order DESC";
        $catalogs = $this->db->query($sql);
        foreach ($catalogs->rows as $catalog) {
            $images = glob(DIR_IMAGE . $catalog['catalog'] . '/*.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}', GLOB_BRACE);
            $result[] = array(
                'title' => $catalog['title'],
                'description' => $catalog['description'],
                'images' => $images
            );
        }
        return $result;
	}
	
	public function getParentName($album_id) {
		$sql = "SELECT name FROM " . DB_PREFIX . "album_descriptionv2 WHERE album_id = '" . (int)$album_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$query = $this->db->query($sql);
		return $query->row['name'];
	}
	
	public function getParents($album_id) {
		$parents = array();
		if ($album_id != 0) {
			$sql = "SELECT ad.name, a.parent_id FROM " . DB_PREFIX . "albumv2 a LEFT JOIN " . DB_PREFIX . "album_descriptionv2 ad ON (a.album_id = ad.album_id) WHERE a.album_id = '" . (int)$album_id . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			$result = $this->db->query($sql)->row;
			
			$parents[] = array(
				'album_id'	=> $album_id,
				'name'		=> $result['name'],
				'child'		=> $this->getParents($result['parent_id'])
			);
		}
		return $parents;
	}
}