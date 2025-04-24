using UnityEngine;

public class dispararController : MonoBehaviour
{
    Rigidbody fis;
    public float force = 5f; // Force to be applied to the projectile
    void Start()
    {
        fis = GetComponent<Rigidbody>();
        fis.AddForce(transform.forward * force);
        Destroy(gameObject, 2f); 
    }

    void Update()
    {
        
    }
}
