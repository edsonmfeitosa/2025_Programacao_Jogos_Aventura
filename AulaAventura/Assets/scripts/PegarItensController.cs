using UnityEngine;

public class PegarItensController : MonoBehaviour
{
    public int qtd = 0;
    void Start()
    {
        
    }

    void Update()
    {
        
    }
    private void OnCollisionEnter(Collision collision)
    {
       
        if (collision.gameObject.tag == "espada")
        {
            qtd = qtd + 1;
            // qtd ++;
            Destroy(collision.gameObject);
            Debug.Log("Pegou a espada");
        }
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "espada")
        {
            qtd ++;
            Destroy(other.gameObject);
            Debug.Log("Pegou a espada");
        }
    }
}
