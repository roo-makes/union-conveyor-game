using _Framework;
using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class WidgetMovement : MonoBehaviour
    {
        [SerializeField] private FloatVariable speed;

        void Update()
        {
            transform.Translate(speed.Value * Time.deltaTime, 0, 0);
        }
    }
}