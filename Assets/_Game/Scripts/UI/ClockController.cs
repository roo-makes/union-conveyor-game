using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Playables;

namespace _Game.Scripts.UI
{
    public class ClockController : MonoBehaviour
    {
        [SerializeField] private PlayableDirector _dayDirector;
        [SerializeField] private float _secondsPerHour;

        private TextMeshProUGUI clockText;

        void Awake()
        {
            clockText = GetComponentInChildren<TextMeshProUGUI>();
        }
        void Update()
        {
            var time = (float)_dayDirector.time;

            var hours = Mathf.FloorToInt(time / _secondsPerHour);
            var mins = Mathf.FloorToInt(60 * (time % _secondsPerHour) / _secondsPerHour);

            hours += 9;
            if (hours > 12) hours -= 12;
            
            clockText.text = $"{hours}:{mins:D2}";
        }
    }
}