using UnityEngine;

public class PegarItensController : MonoBehaviour
{
    public int qtd = 0;
    public GameObject rifle;
    public MovCamPlayerController mov;
    void Start()
    {
        
    }

    void Update()
    {
        //Vari�vel static - � uma vari�vel da classe, todos os objetos ter�o o mesmo valor
        //if (MovCamPlayerController.estaPrimeiraPessoa)
        // vari�vel de objeto - cada objeto tem seu valor
        if (mov.estaPrimeiraPessoa)
        {
            rifle.SetActive(true);
        }
        else
        {
            rifle.SetActive(false);
        }
    }
    private void OnCollisionEnter(Collision collision)
    {
       
        if (collision.gameObject.tag == "espada")
        {
            qtd = qtd + 1;
            // qtd ++;
            collision.gameObject.GetComponent<tipoItem>().categoria.quantidade++;
            Destroy(collision.gameObject);
            Debug.Log("Pegou a espada");
        }
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "espada")
        {
            qtd ++;
            other.gameObject.GetComponent<tipoItem>().categoria.quantidade++;
            Destroy(other.gameObject);
            Debug.Log("Pegou a espada");
        }
    }
}
