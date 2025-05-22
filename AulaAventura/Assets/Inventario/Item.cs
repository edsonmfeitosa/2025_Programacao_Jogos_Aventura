using UnityEngine;

[CreateAssetMenu(fileName = "Novo Item", 
    menuName = "Inventario/Item")]
public class Item : ScriptableObject
{
    public string nome;
    public string descricao;
    public Sprite icone;
}
