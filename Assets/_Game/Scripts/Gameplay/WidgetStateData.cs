using HutongGames.PlayMaker;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class WidgetStateData : MonoBehaviour
    {
        private bool _isFilled = false;
        private bool _isDosed = false;
        private bool _isSanitized = false;

        [SerializeField] private UnityEvent WidgetReset;
        [SerializeField] private UnityEvent WidgetSanitized;
        [SerializeField] private UnityEvent WidgetStartFill;
        [SerializeField] private UnityEvent WidgetFilled;

        public bool IsFilled => FillPercent >= 1;
        public bool IsDosed => _isDosed;
        public bool IsSanitized => _isSanitized;
        public float FillPercent { get; set; }

        public void Reset()
        {
            _isFilled = false;
            _isDosed = false;
            _isSanitized = false;
            FillPercent = 0f;
            WidgetReset.Invoke();
        }

        public void Sanitize()
        {
            if (!_isSanitized)
            {
                _isSanitized = true;
                WidgetSanitized.Invoke();
            }
        }

        public void AddFill(float amount)
        {
            if (FillPercent == 0f && amount > 0f) WidgetStartFill.Invoke();

            FillPercent += amount;
            
            if (IsFilled) WidgetFilled.Invoke();
        }
    }
}