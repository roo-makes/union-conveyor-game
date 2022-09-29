using _Framework;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class WidgetSpawner : MonoBehaviour
    {
        [SerializeField] private UnityEvent<GameObject> _spawnedWidget;
        [SerializeField] private FloatVariable _spawnRate;

        private Collider2D _collider;
        private BoxCollider2D _lastSpawned;

        void Awake()
        {
            _collider = GetComponent<BoxCollider2D>();
        }
        
        void Start()
        {
            InvokeRepeating("SpawnWidget", 0, _spawnRate.Value);
        }
        
        public void SpawnWidget()
        {
            var widgetGO = WidgetPool.Instance.GetWidget();
            // _lastSpawned = widgetGO.GetComponent<BoxCollider2D>();
            widgetGO.transform.SetParent(transform);
            widgetGO.transform.position = transform.position;
            _spawnedWidget.Invoke(widgetGO);
        }
    }
}