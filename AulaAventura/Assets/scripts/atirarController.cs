using UnityEngine;

public class atirarController : MonoBehaviour
{
    public GameObject bala;
    public GameObject canoArma;

    [Header("Sons")]
    private AudioSource somTiro;
    public AudioClip tiro;
    public AudioClip recarregar;
    void Start()
    {
        somTiro = GetComponent<AudioSource>();
    }

    void Update()
    {
        if (Input.GetMouseButton(0))
        {
            GameObject novaBala = Instantiate(bala, 
                canoArma.transform.position, 
                canoArma.transform.rotation);
            somTiro.clip = tiro;
            somTiro.Play();
            //somTiro.PlayOneShot(tiro);
        }
        if (Input.GetMouseButtonDown(1))
        {
            if (!somTiro.isPlaying)
            {
                somTiro.clip = recarregar;
                somTiro.Play();
                //somTiro.PlayOneShot(recarregar);
            }
        }
    }
}
