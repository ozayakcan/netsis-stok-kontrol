<?php
class App_Model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }
    
    public $hostStr = "host";
    public $veritabaniAdiStr = "veritabaniAdi";
    public $kullaniciAdiStr = "kullaniciAdi";
    public $sifreStr = "sifre";
    public $tblStok = "TBLSTSABIT";
    public $tblStokHar = "TBLSTHAR";
    public $stokKoduStr = "STOK_KODU";
    public $baslangicStr = "baslangic";
    public $ogeSayisiStr = "ogeSayisi";
    public function stoklar($host, $veritabaniAdi, $kullaniciAdi, $sifre, $baslangic, $ogeSayisi, $port = "")
    {
        return $this->veritabani($host, $veritabaniAdi, $kullaniciAdi, $sifre, $port)->limit($ogeSayisi,$baslangic)->order_by($this->stokKoduStr, "DESC")->get($this->tblStok)->result();
    }
    public function stokHareket($host, $veritabaniAdi, $kullaniciAdi, $sifre, $stokKodu, $port = "")
    {
        $where = array();
        if (strlen($stokKodu) > 0) {
            $where[$this->stokKoduStr] = $this->turkceKarakterArama($stokKodu);
        }
        return $this->veritabani($host, $veritabaniAdi, $kullaniciAdi, $sifre, $port)->where($where)->get($this->tblStokHar)->result();
    }
    public function veritabaniPost()
    {
        return array(
            $this->hostStr => $this->input->post($this->hostStr),
            $this->veritabaniAdiStr => $this->input->post($this->veritabaniAdiStr),
            $this->kullaniciAdiStr => $this->input->post($this->kullaniciAdiStr),
            $this->sifreStr => $this->input->post($this->sifreStr),
        );
    }
    public function veritabani($host, $veritabaniAdi, $kullaniciAdi, $sifre, $port = "")
    {
        $config['base_url'] = "http://" . $host . ":8080";
        $veritabani = array(
            'dsn'    => '',
            'hostname' => "localhost," . (strlen($port) > 0 ? $port : "1433"),
            'username' => $kullaniciAdi,
            'password' => $sifre,
            'database' => $veritabaniAdi,
            'dbdriver' => 'sqlsrv',
            'dbprefix' => '',
            'pconnect' => FALSE,
            'db_debug' => TRUE,
            'cache_on' => FALSE,
            'cachedir' => '',
            'char_set' => 'utf8',
            'dbcollat' => 'utf8_general_ci',
            'swap_pre' => '',
            'encrypt' => FALSE,
            'compress' => FALSE,
            'stricton' => FALSE,
            'failover' => array(),
            'save_queries' => TRUE
        );
        return $this->load->database($veritabani, TRUE);
    }
    public $bozukHarfler = array(
        '\u00d0',
        '\u00de',
        '\u00dc',
        '\u00dd',
        '\u00d6',
        '\u00c7',
        'I'
    );
    public $buyukHarfler = array(
        'Ğ',
        'Ş',
        'Ü',
        'İ',
        'Ö',
        'Ç',
        'I'
    );
    public function turkceKarakter($str)
    {
        return str_replace($this->bozukHarfler, $this->buyukHarfler, $str);
    }
    public $aramaKarakterler = array(
        'i',
        'İ',
        'ğ',
        'Ğ',
        'ş',
        'Ş'
    );
    public $aramaSemboller = array(
        'Ý',
        'Ý',
        'Ð',
        'Ð',
        'Þ',
        'Þ'
    );
    public function turkceKarakterArama($str)
    {
        return str_replace($this->aramaKarakterler, $this->aramaSemboller, $str);
    }
}
