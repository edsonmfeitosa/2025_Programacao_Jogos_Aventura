using UnityEngine;

public class aviaoController : MonoBehaviour
{
    [Header("Elise")]
    [SerializeField] private float velocidade;
    [SerializeField] private GameObject elise;
    [Header("Avião")]
    [SerializeField] private bool ligar = false;
    void Start()
    {
        
    }

 
    void Update()
    {
        if (ligar == true)
        {
            giroElise();
        }
          
    }

    void giroElise()
    {
        elise.transform.Rotate(0, 
            velocidade * Time.deltaTime, 0);
    }
}
