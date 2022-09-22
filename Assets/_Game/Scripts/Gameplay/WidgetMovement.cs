using _Framework;
using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class WidgetMovement : MonoBehaviour
    {
        [SerializeField] private FloatVariable speed;
        [SerializeField] private float speedOverride;
        private bool isspeedNull;

        private void Start()
        {
            isspeedNull = speed == null;
        }

        void Update()
        {
            var transformPosition = transform.position;
            if (isspeedNull)
            {
                transform.Translate(speedOverride * Time.deltaTime, 0, 0);
            }
            else
            {
                transform.Translate(speed.Value * Time.deltaTime, 0, 0);
            }
        }
    }
}