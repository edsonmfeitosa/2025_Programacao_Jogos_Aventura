using UnityEngine;

public class atirarController : MonoBehaviour
{
    public GameObject bala;
    public GameObject canoArma;
    void Start()
    {
        
    }

    void Update()
    {
        if (Input.GetMouseButton(0))
        {
            GameObject novaBala = Instantiate(bala, 
                canoArma.transform.position, 
                canoArma.transform.rotation);
        }
    }
}
