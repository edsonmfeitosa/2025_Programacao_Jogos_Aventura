using UnityEngine;

public class MovCamPlayerController : MonoBehaviour
{
    public Camera camera1P;
    public Camera camera3P;
    public KeyCode trocaCamera;
    private bool estaPrimeiraPessoa = true;
    private float mouseX = 0f;
    private float mouseY = 0f;
    public float sensibilidade = 3f;
    void Start()
    {
        
    }

    void Update()
    {
        if(Input.GetKeyDown(trocaCamera))
        {
            estaPrimeiraPessoa = !estaPrimeiraPessoa;
        }
        if (estaPrimeiraPessoa)
        {
            camera1P.enabled = true;
            camera3P.enabled = false;
            rotacaoCamera();
        }
        else
        {
            camera1P.enabled = false;
            camera3P.enabled = true;
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
    }
    void rotacaoCamera()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        mouseX += Input.GetAxis("Mouse X") * sensibilidade;
        mouseY -= Input.GetAxis("Mouse Y") * sensibilidade;
        mouseY = Mathf.Clamp(mouseY, -40f, 40f);
        mouseX = Mathf.Clamp(mouseX, -45f, 45f);
        transform.eulerAngles = new Vector3(mouseY, mouseX, 0f);
    }
}
