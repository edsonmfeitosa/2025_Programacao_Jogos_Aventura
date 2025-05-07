using UnityEngine;
using UnityEngine.UI;

public class TempoJogoController : MonoBehaviour
{
    private double tempoJogo= 0;
    public Text tempoJogoText;
    public static bool fimDeJogo = false;
    void Update()
    {
        if (!fimDeJogo)
        {
            tempoJogo += Time.deltaTime;
        }
        tempoJogoText.text = "Tempo de Jogo: " + tempoJogo.ToString("F2") + "s";
    }
}
