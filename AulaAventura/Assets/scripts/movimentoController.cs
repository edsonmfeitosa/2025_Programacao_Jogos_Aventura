using UnityEngine;

public class movimentoController : MonoBehaviour
{
    Animator anim;
    private float movX;
    private float movZ;
    public float velocidade;
    public float velocidadeRotacao;

    void Start()
    {
        anim = GetComponent<Animator>();
    }

    
    void Update()
    {
        anim.SetBool("podeAndar", false);
        movX = Input.GetAxis("Horizontal");
        movZ = Input.GetAxis("Vertical");
        if(movX != 0 || movZ != 0)
        {
            anim.SetBool("podeAndar", true);
        }
        transform.Translate(new Vector3 (0, 0, movZ) *
            velocidade * Time.deltaTime);
        transform.Rotate(new Vector3(0, movX, 0) * 
            velocidadeRotacao);
    }
}
