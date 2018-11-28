<?php

class List_m extends CI_Model {
    public $table = 'list';
    public $table_food = 'food';
    public $table_food_description = 'food_description';
    public $table_company = 'company';
    public $table_company_description = 'company_description';
    public $primary_key = 'id';

    function get($userId){

        $this->db->select('list.id, food.id as id_food, list.id_user, description.title, company_description.title as company')
            ->from($this->table.' as list')
            ->join($this->table_food.' as food', 'food.id'.' = list.id_food', 'inner')
            ->join($this->table_food_description.' as description', 'description.id_food'.' = food.id', 'inner')
            ->join($this->table_company.' as company', 'company.id'.' = food.id_company', 'inner')
            ->join($this->table_company_description.' as company_description', 'company_description.id_company'.' = company.id', 'inner')
            ->where('list.id_user', $userId)
            ->order_by('description.title', 'ASC');

        $query = $this->db->get();
        $data = $query->result();

        return $data;
    }

    public function delete($id = 0)
    {
        try {
            $delete = false;
            $delete = $this->db->where('id', $id)->delete($this->table);

            return $delete;
        } catch (Exception $e) {
            log_message('error', print_r($e, true));
        }
    }

    public function insert($data)
    {
        $this->db->trans_start();

        $sql = $this->db->insert(
            $this->table,
            array(
                'id_user' => $data['id_user'],
                'id_food' => $data['id_food']
            )
        );

        $id = $this->db->insert_id();
        $this->db->trans_complete();
        
        return $id;
    }
}

?>