using System;
using UnityEngine;

public class inventarioController : MonoBehaviour
{
    public static int quantidadePecas = 0;
    public GameObject player;
    private Vector3 posicaoIncial;
    public Transform posicaoAgua;
    void Start()
    {
        posicaoIncial = player.transform.position;
    }

    void Update()
    {
        if (transform.position.y < posicaoAgua.position.y)
        {
            transform.position = posicaoIncial;
        }
    }
    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log("Colidiu com: " + collision.gameObject.name);
        if (collision.gameObject.tag == "peca")
        {
            quantidadePecas++;
            Debug.Log("Peca coletada! Total de pecas: " + quantidadePecas);
            Destroy(collision.gameObject);
        }
    }
}
