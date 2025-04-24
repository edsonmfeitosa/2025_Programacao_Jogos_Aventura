using UnityEngine;

public class aviaoController : MonoBehaviour
{
    [Header("Elise")]
    [SerializeField] private float velocidade;
    [SerializeField] private GameObject elise;
    [Header("Avião")]
    [SerializeField] private bool ligar = false;
    [SerializeField] private KeyCode acelerar;
    [SerializeField] private KeyCode frear;
    [SerializeField] private KeyCode paraCima;
    [SerializeField] private KeyCode paraBaixo;
    [SerializeField] private KeyCode paraEsquerda;
    [SerializeField] private KeyCode paraDireita;
    private float velocidadeAviao = 0;
    [Header("Câmeras")]
    [SerializeField] private GameObject camera1Pessoa;
    [SerializeField] private GameObject camera3Pessoa;
    [SerializeField] private Camera retrovisor;
    [SerializeField] private KeyCode habilitaRetrovisor;
    void Start()
    {
        
    }

 
    void Update()
    {
        controlaCameras();
        if (ligar == true)
        {
            giroElise();
            controlarAviao();
        }
          
    }
    void controlarAviao()
    {
        #region Acelerar/Frear
        if (Input.GetKey(acelerar))
        {
            velocidadeAviao -= 1f;
            //velocidadeAviao = velocidadeAviao + 0.1f;
        }
        if (Input.GetKey(frear))
        {
            if (velocidade < 1)
            {
                velocidadeAviao += 1f;
            }
            
        }

        transform.Translate(Vector3.up * velocidadeAviao * Time.deltaTime);
        #endregion

        #region direcionar o avião
        float movX = 0;
        float movY = 0;
        if (Input.GetKey(paraCima))
        {
            movY = -1;
        }
        if (Input.GetKey(paraBaixo))
        {
            movY = 1;
        }
        if (Input.GetKey(paraEsquerda))
        {
            movX = -1;
        }
        if (Input.GetKey(paraDireita))
        {
            movX = 1;
        }
        transform.Rotate(movY, movX, movX);
        #endregion
    }

    void giroElise()
    {
        elise.transform.Rotate(0, 
            velocidade * Time.deltaTime, 0);
    }
    void controlaCameras()
    {
        retrovisor.enabled = false;
        if (ligar)
        {
            camera1Pessoa.SetActive(true);
            camera3Pessoa.SetActive(true);
            #region espelho retrovisor
            
            if (Input.GetKey(habilitaRetrovisor))
            {
                retrovisor.enabled = true;
            }
            #endregion
        }
        else
        {
            camera1Pessoa.SetActive(false);
            camera3Pessoa.SetActive(false);
        }
        
    }
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.name == "Player")
        {
            ligar = true;
            collision.gameObject.SetActive(false);
        }
    }
}
