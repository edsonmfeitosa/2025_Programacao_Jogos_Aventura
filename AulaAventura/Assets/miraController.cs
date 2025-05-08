using UnityEngine;

public class miraController : MonoBehaviour
{
    [Header("Laser")]
    [SerializeField] private KeyCode miraLaser;
    [SerializeField] private LineRenderer laser;
    private bool laserHabilitado = false;
    [SerializeField] GameObject posInicialLaser;
    [SerializeField] float distancia = 1000;
    [Header("Lupa")]
    [SerializeField] private KeyCode miraLupa;
    [SerializeField] private GameObject CameraLupa;
    private bool lupaHabilitada = false;
    void Start()
    {
        
    }

    void Update()
    {
        #region Laser
        if (Input.GetKeyDown(miraLaser))
            laserHabilitado = !laserHabilitado;
        if (laserHabilitado)
        {
            laser.enabled = true;
            laser.SetPosition(0, posInicialLaser.transform.position);
            laser.SetPosition(1,
                posInicialLaser.transform.forward * distancia);
        }
        else
            laser.enabled = false;
        #endregion

        #region Lupa
        if (Input.GetKeyDown(miraLupa))
            lupaHabilitada = !lupaHabilitada;

        if (lupaHabilitada)
        {
            CameraLupa.SetActive(true);
        }
        else
        {
            CameraLupa.SetActive(false);
        }
        #endregion
    }
}
