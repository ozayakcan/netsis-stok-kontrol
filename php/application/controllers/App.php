<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
        $this->load->model("App_Model");
    }
	public function index()
	{
		echo "App";
	}
    public function stoklar(){
        $this->headerlar();
        $veritabaniPost = $this->App_Model->veritabaniPost();
        $stoklar = $this->App_Model->stoklar($veritabaniPost[$this->App_Model->hostStr], $veritabaniPost[$this->App_Model->veritabaniAdiStr], $veritabaniPost[$this->App_Model->kullaniciAdiStr], $veritabaniPost[$this->App_Model->sifreStr]);
        echo $this->App_Model->turkceKarakter(json_encode($stoklar));
    }
    public function stokHareket(){
        $this->headerlar();
        $stokKod = $this->input->post($this->App_Model->stokKoduStr);
        $veritabaniPost = $this->App_Model->veritabaniPost();
        $stokHareket = $this->App_Model->stokHareket($veritabaniPost[$this->App_Model->hostStr], $veritabaniPost[$this->App_Model->veritabaniAdiStr], $veritabaniPost[$this->App_Model->kullaniciAdiStr], $veritabaniPost[$this->App_Model->sifreStr], $stokKod);
        echo $this->App_Model->turkceKarakter(json_encode($stokHareket));
    }
    public function headerlar()
    {
        if (isset($_SERVER['HTTP_ORIGIN'])) {
            header("Access-Control-Allow-Origin: *");
            header('Access-Control-Allow-Credentials: true');
            header('Access-Control-Max-Age: 86400');
        }
        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
            header("Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT");

        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
            header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
    }
}
