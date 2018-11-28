<?php

class Food_m extends CI_Model {
    public $table = 'food';
    public $table_description = 'food_description';
    public $table_file = 'ez_file';
    public $table_company = 'company';
    public $table_company_description = 'company_description';
    public $primary_key = 'id';
    public $foreign_key = 'id_food';

    function get($id = FALSE){

        $this->db->select('food.id, description.title, description.rating, description.text, file.file, file.path, file_comapany.file as file_company, company_description.title as company_title')
            ->from($this->table.' as food')
            ->join($this->table_description.' as description', 'description.id_food'.' = food.id', 'inner')
            ->join($this->table_file.' as file', 'food.id_image'.' = file.id', 'inner')
            ->join($this->table_company.' as company', 'company.id'.' = food.id_company', 'inner')
            ->join($this->table_company_description.' as company_description', 'company_description.id_company'.' = company.id', 'inner')
            ->join($this->table_file.' as file_comapany', 'company.id_image'.' = file_comapany.id', 'inner')
            ->where('food.status = 1')
            ->order_by('description.title', 'ASC');

        if($id)
            $this->db->where('food.id', $id);
        else
            $this->db->where('food.id not in (select id_food from list where id_food = food.id)');
        

        $query = $this->db->get();
        $data = $query->result();

        return $data;
    }
}

?>